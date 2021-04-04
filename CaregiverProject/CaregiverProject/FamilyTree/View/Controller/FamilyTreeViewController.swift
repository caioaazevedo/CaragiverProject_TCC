//
//  FamilyTreeViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit
import Combine

class FamilyTreeViewController: UIViewController {
    private let viewModel: FamilyTreeViewModel
    private let dataSource: FamilyTreeDataSource
    private let familyTreeView: FamilyTreeView
    private var subscribers = Set<AnyCancellable>()
    
    init(viewModel: FamilyTreeViewModel,
         familyTreeView: FamilyTreeView,
         dataSource: FamilyTreeDataSource) {
        self.viewModel = viewModel
        self.familyTreeView = familyTreeView
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = familyTreeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.portrait)
        viewModel.fetchData()
        hideActivityIndicator()
        showActivityIndicator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppUtility.lockOrientation(.all)
    }
    
    private func setupButton() {
        familyTreeView.groupInviteLabel
            .addAction(UIAction { [inviteMember] _ in
                inviteMember()
            },
            for: .touchUpInside)
    }
    
    private func bindViewModel() {
        viewModel.$members
            .receive(on: DispatchQueue.main)
            .sink { [familyTreeView, hideActivityIndicator, dataSource] members in
                dataSource.update(members: members)
                familyTreeView.collectionView.reloadData()
                hideActivityIndicator()
            }
            .store(in: &subscribers)
        
        viewModel.$elder
            .receive(on: DispatchQueue.main)
            .sink { [familyTreeView] profile in
                familyTreeView.elderName.text = profile?.name ?? "Elder"
                familyTreeView.elderImage.image = profile?.photo
            }
            .store(in: &subscribers)
    }
    
    private func inviteMember() {
        if let familyID = UserSession.shared.familyID,
           let url = URL(string: "login://" + "\(familyID)") {
            
            let fullText = ["\(familyID) está te convidando para entrar no grupo. Token: \(url)."]
            let activityViewController = UIActivityViewController(
                activityItems: fullText as [Any],
                applicationActivities: nil
            )
            
            activityViewController.popoverPresentationController?.sourceView = view
            activityViewController.excludedActivityTypes = [.print]
            present(activityViewController, animated: true, completion: nil)
        }
    }
}

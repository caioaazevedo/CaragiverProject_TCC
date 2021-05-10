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
    weak var coordinator: FamilyCoordinator?
    
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
        familyTreeView.inviteButton
            .addAction(UIAction { [inviteMember] _ in
                inviteMember()
            },
            for: .touchUpInside)
    }
    
    private func bindViewModel() {
        viewModel.$members
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: updateMembers)
            .store(in: &subscribers)
        
        viewModel.$elder
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: updateProfile)
            .store(in: &subscribers)
    }
    
    private func updateMembers(_ members: Members) {
        dataSource.update(members: members)
        familyTreeView.collectionView.reloadData()
        hideActivityIndicator()
    }
    
    private func updateProfile(_ profile: ProfileModel?) {
        guard let elder = profile else { return }
        familyTreeView.elderName.text = elder.name
        familyTreeView.elderImage.image = elder.photo ?? UIImage(named: "profileIcon")
    }
    
    private func inviteMember() {
        coordinator?.presentInvitationView(id: UserSession.shared.familyID)
    }
}

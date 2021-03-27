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
    private let familyTreeView: FamilyTreeView
    var callRefresh: (() ->())?
    private var subscribers = Set<AnyCancellable>()
    
    init(viewModel: FamilyTreeViewModel,
         familyTreeView: FamilyTreeView) {
        self.viewModel = viewModel
        self.familyTreeView = familyTreeView
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
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
        self.callRefresh?()
        viewModel.queryMembers()
        hideActivityIndicator()
        showActivityIndicator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppUtility.lockOrientation(.all)
    }
    
    private func bindViewModel() {
        viewModel.$members
            .receive(on: DispatchQueue.main)
            .sink { [familyTreeView, hideActivityIndicator] members in
                let dataSource = FamilyTreeDataSource(members: members)
                familyTreeView.collectionView.dataSource = dataSource
                hideActivityIndicator()
            }
            .store(in: &subscribers)
    }
    
    func assignSubscriber(publisher: AnyPublisher<ProfileEntity,Never>){        
        publisher
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] profile in
                guard let `self` = self,let view = self.view as? FamilyTreeView else {return}                
                view.elderName.text = profile.name
                view.elderImage.image = profile.photo
            }
            .store(in: &subscribers)
    }
}

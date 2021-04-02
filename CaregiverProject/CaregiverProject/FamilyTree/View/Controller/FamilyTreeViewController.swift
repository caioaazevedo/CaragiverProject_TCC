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
    var callRefresh: (() ->())?
    private var subscribers = Set<AnyCancellable>()
    
    init(viewModel: FamilyTreeViewModel,
         familyTreeView: FamilyTreeView,
         dataSource: FamilyTreeDataSource) {
        self.viewModel = viewModel
        self.familyTreeView = familyTreeView
        self.dataSource = dataSource
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
    
    func bindViewModel() {
        viewModel.$members
            .receive(on: DispatchQueue.main)
            .sink { [familyTreeView, hideActivityIndicator, dataSource] members in
                dataSource.update(members: members)
                familyTreeView.collectionView.reloadData()
                hideActivityIndicator()
            }
            .store(in: &subscribers)
    }
    
    func assignSubscriber(publisher: AnyPublisher<ProfileModel,Never>) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink{ [familyTreeView] profile in
                familyTreeView.elderName.text = profile.name
                familyTreeView.elderImage.image = profile.photo
            }
            .store(in: &subscribers)
    }
}

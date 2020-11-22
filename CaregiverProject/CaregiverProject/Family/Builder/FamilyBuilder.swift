//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase

final class FamilyBuilder{
    
    class func buildFamilyModule(state: ManageState) -> FamilyManageViewController{
        let interactor = FamilyInteractor(database: Database.database())
        let familyViewController = FamilyManageViewController(manageState: state, familyManagePresenter: FamilyPresenter(with: interactor))
        return familyViewController
    }
    
    class func buildFamilyListModule(with interactor: inout FamilyInteractorProtocol) -> FamilyListViewController{
        let familyListController = FamilyListViewController(presentedView: FamilyListView(), familyPresenter: FamilyPresenter(with: interactor))       
        return familyListController
    }
    
    class func buildFamilyTreeModule() -> FamilyTreeViewController{
        let familyTreeController = FamilyTreeViewController()
        let interactor = FamilyInteractor(database: Database.database())
        let presenter = FamilyPresenter(with: interactor)
        let view = FamilyTreeView()
        view.collectionView.delegate = familyTreeController
        view.collectionView.dataSource = familyTreeController
        familyTreeController.presenter = presenter
        familyTreeController.presentedView = view
        return familyTreeController
    }

    class func buildFamilyTabBarController() -> FamilyTabBarController{
        let familyTabBarController = FamilyTabBarController()
        familyTabBarController.modalPresentationStyle = .fullScreen
        let familyTreeModule = FamilyBuilder.buildFamilyTreeModule()
        familyTreeModule.familyId = UserSession.shared.familyID
        familyTreeModule.viewDidLoad()
        let familyIcon = UITabBarItem(title: "Family", image: .actions, tag: 0)
        familyTreeModule.tabBarItem = familyIcon
        let profileModule = ProfileBuilder.buildProfileModule()
        let profileIcon = UITabBarItem(title: "Elder", image: .checkmark, tag: 1)
        profileModule.tabBarItem = profileIcon
        
        familyTabBarController.viewControllers = [
            familyTreeModule,
            profileModule
        ]
        return familyTabBarController
    }
}

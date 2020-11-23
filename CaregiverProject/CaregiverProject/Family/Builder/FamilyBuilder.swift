//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase
import Combine

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
        view.completion = {
            let textToShare = [UserSession.shared.familyID]
            let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = familyTreeController.view            
            familyTreeController.present(activityViewController, animated: true, completion: nil)
        }
        view.collectionView.delegate = familyTreeController
        view.collectionView.dataSource = familyTreeController
        familyTreeController.presenter = presenter
        familyTreeController.presentedView = view
        return familyTreeController
    }
    
    class func buildProfileModule() -> ProfileViewController{
        let interactor = ProfileInteractor(database: Database.database())
        let familyViewController = ProfileViewController(presenter: ProfilePresenter(with: interactor))
        return familyViewController
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
        familyTreeModule.assignSubscriber(publisher: profileModule.publisher)
        profileModule.setupData()
        familyTabBarController.viewControllers = [
            familyTreeModule,
            profileModule
        ]
        return familyTabBarController
    }
}

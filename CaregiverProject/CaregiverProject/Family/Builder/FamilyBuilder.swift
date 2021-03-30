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
    
    class func buildFamilyTreeModule() -> FamilyTreeViewController{
        let familyTreeController = FamilyTreeViewController()
        let interactor = FamilyInteractor(database: Database.database())
        let presenter = FamilyPresenter(with: interactor)
        let view = FamilyTreeView()
        view.completion = {
            let url = URL(string: "login://" + "\(UserSession.shared.familyID!)")
            let fullText = ["\(UserSession.shared.username!) está te convidando para entrar no grupo. Token: \(url!)."]
            
            let activityViewController = UIActivityViewController(activityItems: fullText as [Any], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = familyTreeController.view
            activityViewController.excludedActivityTypes = [.print]
            familyTreeController.present(activityViewController, animated: true, completion: nil)
        }
        view.collectionView.delegate = familyTreeController
        view.collectionView.dataSource = familyTreeController
        familyTreeController.presenter = presenter
        familyTreeController.presentedView = view
        return familyTreeController
    }
    
    class func buildFamilyTabBarController() -> FamilyTabBarController{
        let familyTabBarController = FamilyTabBarController()
        familyTabBarController.modalPresentationStyle = .fullScreen
        
        let familyTreeModule = setUpFamilyTreeModule()
        let profileModule = setUpProfileModule()
        
        familyTreeModule.assignSubscriber(publisher: profileModule.publisher)
        familyTreeModule.callRefresh  = {
            profileModule.setupData()
        }
        
        familyTabBarController.viewControllers = [
            familyTreeModule,
            profileModule
        ]
        return familyTabBarController
    }
    
    class func setUpFamilyTreeModule() -> FamilyTreeViewController{
        let familyTreeModule = FamilyBuilder.buildFamilyTreeModule()
        familyTreeModule.familyId = UserSession.shared.familyID
        familyTreeModule.viewDidLoad()
        let familyIcon = UITabBarItem(title: "Family", image: .actions, tag: 0)
        familyTreeModule.tabBarItem = familyIcon
        
        return familyTreeModule
    }
    
    class func setUpProfileModule() -> ProfileViewController {
        let viewModel = ProfileViewModel(database: Database.database())
        let profileModule = ProfileViewController(viewModel: viewModel)
        let profileIcon = UITabBarItem(title: "Elder", image: .checkmark, tag: 1)
        profileModule.tabBarItem = profileIcon
        profileModule.setupData()
        
        return profileModule
    }
}

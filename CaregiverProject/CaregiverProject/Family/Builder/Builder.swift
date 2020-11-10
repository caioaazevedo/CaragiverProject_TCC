//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase

final class Builder{
    
    class func buildFamilyModule(state: ManageState) -> FamilyManageViewController{
        let interactor = FamilyInteractor(database: Database.database())
        let familyViewController = FamilyManageViewController(manageState: state, familyManagePresenter: FamilyPresenter(with: interactor))
        return familyViewController
    }
    
    class func buildFamilyListModule(with interactor: inout FamilyInteractor) -> FamilyListViewController{
        let familyListController = FamilyListViewController(presentedView: FamilyListView(), familyPresenter: FamilyPresenter(with: interactor))
        familyListController.presenter = FamilyPresenter(with: interactor)
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
}

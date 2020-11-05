//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase

final class Builder{
    
    class func buildFamilyModule() -> FamilyManageViewController{
        let interactor = FamilyInteractor(database: Database.database())
        let familyViewController = FamilyManageViewController(familyManagePresenter: FamilyPresenter(with: interactor))
        return familyViewController
    }
    
    class func buildFamilyListModule(with interactor: inout FamilyInteractor) -> FamilyListViewController{
        let familyListController = FamilyListViewController(presentedView: FamilyListView(), familyPresenter: FamilyPresenter(with: interactor))
        familyListController.presenter = FamilyPresenter(with: interactor)
        return familyListController
    }
}

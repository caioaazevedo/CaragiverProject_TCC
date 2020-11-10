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
    
}

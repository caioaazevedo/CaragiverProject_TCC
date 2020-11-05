//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase

final class Builder{
    class func buildFamilyModule() -> FamilyListViewController{
        let interactor = FamilyInteractor(database: Database.database())
        let familyView = FamilyListViewController(presentedView: FamilyListView(), familyPresenter: FamilyPresenter(with: interactor))
        familyView.presenter = FamilyPresenter(with: interactor)
        return familyView
    }
}

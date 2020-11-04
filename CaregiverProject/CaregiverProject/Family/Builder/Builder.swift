//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

final class Builder{
    class func buildFamilyModule(familyView: inout FamilyListViewController){
        let interactor = FamilyInteractor()
        familyView.presenter = FamilyPresenter(with: interactor)
    }
}

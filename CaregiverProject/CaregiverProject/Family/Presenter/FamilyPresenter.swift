//
//  FamilyPresenter.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

protocol FamilyPresenterProtocol{}

class FamilyPresenter: FamilyPresenterProtocol{
    fileprivate var interactor: FamilyInteractorProtocol
    
    init(with interactor: FamilyInteractorProtocol){
        self.interactor = interactor
    }
}

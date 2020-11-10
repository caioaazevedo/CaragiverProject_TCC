//
//  ProfilePresenter.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import Foundation

protocol ProfilePresenterLogic{
    var interactor: ProfileInteractorLogic { get }
    func manageEntity<T>(entity: ModelProtocol,operation: CRUDOperations,completion: @escaping (T?) -> ())
}

class ProfilePresenter: ProfilePresenterLogic{
    
    var interactor: ProfileInteractorLogic
    
    init(with interactor: ProfileInteractorLogic){
        self.interactor = interactor
    }
    
    func manageEntity<T>(entity: ModelProtocol, operation: CRUDOperations, completion: @escaping (T?) -> ()) {
        switch operation{
        case .create:
            break
        case .read:
            break
        case .update:
            break
        case .delete:
            break
        }
    }
    
}

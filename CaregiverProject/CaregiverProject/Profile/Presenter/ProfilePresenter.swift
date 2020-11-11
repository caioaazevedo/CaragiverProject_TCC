//
//  ProfilePresenter.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import Foundation

protocol ProfilePresenterLogic{
    var interactor: ProfileInteractorLogic { get }
    var entity: ProfileEntity? { get set }
    func assignEntity(entityID: String,completion: @escaping () -> ())
    func manageEntity<T>(entity: ModelProtocol,intendedReturn: T.Type,operation: CRUDOperations,completion: @escaping (T?) -> ())
}

class ProfilePresenter: ProfilePresenterLogic{
    
    var interactor: ProfileInteractorLogic
    var entity: ProfileEntity?
    
    init(with interactor: ProfileInteractorLogic){
        self.interactor = interactor
    }
    
    func assignEntity(entityID: String,completion: @escaping () -> ()) {
        interactor.readValue(entityID) { (value) in
            self.entity = value
            completion()
        }
    }
    
    func manageEntity<T>(entity: ModelProtocol,intendedReturn: T.Type,operation: CRUDOperations, completion: @escaping (T?) -> ()) {
        switch operation{
        case .create:
            interactor.addValue(entity) { (result) in
                completion(result as? T)
            }
        case .read:
            interactor.readValue(entity.id) { (result) in
                completion(result as? T)
            }
        case .update:
            interactor.updateValue(entity) { (result) in
                completion(result as? T)
            }
        case .delete:
            interactor.deleteValue(entity.id) { (result) in
                completion(result as? T)
            }
        }
    }
    
}

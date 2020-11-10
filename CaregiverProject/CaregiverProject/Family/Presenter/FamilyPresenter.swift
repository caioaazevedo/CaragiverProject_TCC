//
//  FamilyPresenter.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

protocol FamilyPresenterProtocol{
    func manageEntity<T>(entity: ModelProtocol,entityType: EntityTypes,intendedReturn: T.Type,operation: CRUDOperations,completion: @escaping (T?) -> ())
}

class FamilyPresenter: FamilyPresenterProtocol{
    typealias ResultClosure<T> = (Result<T?,Error>) -> Void
    var interactor: FamilyInteractorProtocol
    
    init(with interactor: FamilyInteractorProtocol){
        self.interactor = interactor
    }
    
    func manageEntity<T>(entity: ModelProtocol,entityType: EntityTypes,intendedReturn: T.Type,operation: CRUDOperations,completion: @escaping (T?) -> ()){
        switch operation{
        case .create:
            interactor.addValue(entity,entityType, completion: { (result) in
                guard let value = result as? T else {return}
                completion(value)
            })
        case .read:
            interactor.readValue(entity.id, entityType, completion: { result in
                guard let value = result as? T else {return completion(nil)}
                completion(value)
            })
        case .update:
            interactor.updateValue(entity,entityType,completion: { result in
                guard let value = result as? T else {return}
                completion(value)
            })
        case .delete:
            interactor.deleteValue(entity.id, entityType,completion: { result in
                guard let value = result as? T else {return}
                completion(value)
            })
        }
    }
}



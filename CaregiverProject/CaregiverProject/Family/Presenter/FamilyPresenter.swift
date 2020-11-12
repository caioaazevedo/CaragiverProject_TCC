//
//  FamilyPresenter.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

protocol FamilyPresenterProtocol{
    var interactor: FamilyInteractorProtocol { get }
    var entity: [String]? { get set }
    func assignEntity(entityID: String,completion: @escaping () -> ())
    func manageEntity<T>(entity: ModelProtocol,entityType: EntityTypes,intendedReturn: T.Type,operation: CRUDOperations,completion: @escaping (T?) -> ())
}

class FamilyPresenter: FamilyPresenterProtocol{
    typealias ResultClosure<T> = (Result<T?,Error>) -> Void
    var interactor: FamilyInteractorProtocol
    var entity: [String]?
    
    init(with interactor: FamilyInteractorProtocol){
        self.interactor = interactor
    }
    
    func assignEntity(entityID: String,completion: @escaping () -> ()){
        interactor.readValue(entityID,.Family) { (value) in
            self.entity = value as? [String] ?? [String]()
            completion()
        }
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



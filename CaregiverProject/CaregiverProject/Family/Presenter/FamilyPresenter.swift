//
//  FamilyPresenter.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

protocol FamilyPresenterProtocol{}

class FamilyPresenter: FamilyPresenterProtocol{
    typealias ResultClosure<T> = (Result<T?,Error>) -> Void
    fileprivate var interactor: FamilyInteractorProtocol
    
    init(with interactor: FamilyInteractorProtocol){
        self.interactor = interactor
    }
    
    func manageEntity<T>(entity: ModelProtocol,intendedReturn: T.Type,operation: CRUDOperations,completion: (T?) -> ()){
        switch operation{
        case .create:
            interactor.addValue(entity, completion: { (result) in
                if result{
                    completion(true as? T)
                } else{
                    completion(false as? T)
                }
                
            })
            
        case .read:
            interactor.readValue(entity.id, completion: { result in
                guard let value = result else {return completion(nil)}
                completion(value as? T)
            })
        case .update:
            interactor.updateValue(entity, completion: { result in
                if result{
                    completion(true as? T)
                } else{
                    completion(false as? T)
                }
            })
        case .delete:
            interactor.deleteValue(entity.id, completion: { result in
                if result{
                    completion(true as? T)
                } else{
                    completion(false as? T)
                }
            })
        }
    }
}



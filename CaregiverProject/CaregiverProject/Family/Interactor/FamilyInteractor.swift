//
//  FamilyInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

typealias FamilyInteractorProtocol = FamilyManagementLogic & MemberManagementLogic

protocol FamilyManagementLogic{
      typealias ResultClosure<T> = (Result<T?,Error>) -> Void
    
      func addValue(_ entity: ModelProtocol, completion: (Bool) -> ())
      func readValue(_ dataID: UUID, completion: (ModelProtocol?) -> ())
      func updateValue(_ entity: ModelProtocol, completion: (Bool) -> ())
      func deleteValue(_ dataID: UUID, completion: (Bool) -> ())
}

protocol MemberManagementLogic{}


class FamilyInteractor:  FamilyInteractorProtocol{
    func addValue(_ entity: ModelProtocol, completion: (Bool) -> ()) {}
    
    func readValue(_ dataID: UUID, completion: (ModelProtocol?) -> ()) {}
    
    func updateValue(_ entity: ModelProtocol, completion: (Bool) -> ()) {}
    
    func deleteValue(_ dataID: UUID, completion: (Bool) -> ()) {}
    
}

//
//  FamilyInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase
import Foundation

typealias FamilyInteractorProtocol = FamilyManagementLogic & MemberManagementLogic

protocol MemberManagementLogic{}
protocol FamilyManagementLogic{
    typealias ResultClosure<T> = (Result<T?,Error>) -> Void
    
    func addValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: (Bool) -> ())
    func readValue(_ dataID: String,_ entityType: EntityTypes, completion: @escaping ([String:AnyObject]) -> ())
    func updateValue(_ entity: ModelProtocol, completion: (Bool) -> ())
    func deleteValue(_ dataID: String, completion: (Bool) -> ())
}


class FamilyInteractor:  FamilyInteractorProtocol{
    
    private let ref: DatabaseReference?
    
    init(database: Database){
        self.ref = database.reference()
    }
    
    func addValue(_ entity: ModelProtocol,_ entityType: EntityTypes, completion: (Bool) -> ()) {
        guard let db = ref else {return}
        switch entityType{
        case .Family:
            guard let casted = entity as? Family else {return}
            let uid = casted.id
            let parameters: [String:Any] = ["name": casted.name,"members":casted.members]
            db.child("family").child(uid).setValue(parameters)
        case .Member:
            guard let casted = entity as? Member else {return} // Need to assign Member
            guard let uid = casted.id else {return}
            let parameters: [String:Any] = ["name": casted.name,"isAdmin":casted.isAdmin]
            db.child("member").child(uid).setValue(parameters)
        }
    }
    
    func readValue(_ dataID: String,_ entityType: EntityTypes, completion: @escaping ([String:AnyObject]) -> ()) {
        switch entityType{
        case .Family:
            _ = self.ref?.observe(DataEventType.value, with: { (snapshot) in
              let postDict = snapshot.value as? [String : AnyObject] ?? [:]
                completion(postDict)
            })
        case .Member:
           print()
        }

    }
    
    func updateValue(_ entity: ModelProtocol, completion: (Bool) -> ()) {}
    
    func deleteValue(_ dataID: String, completion: (Bool) -> ()) {}
    
}

//
//  FamilyInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase
import FirebaseDatabase
import Foundation

typealias FamilyInteractorProtocol = FamilyManagementLogic & MemberManagementLogic

protocol MemberManagementLogic{}

protocol FamilyManagementLogic{
    typealias ResultClosure<T> = (Result<T?,Error>) -> Void
    var ref: DatabaseReference? {get}
    func addValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
    func readValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping ([String]) -> ())
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
}


class FamilyInteractor:  FamilyInteractorProtocol{
    
    internal let ref: DatabaseReference?
    
    init(database: Database){
        self.ref = database.reference()
    }
    
    func addValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ()) {
        guard let db = ref else {return}
        switch entityType{
        case .Family:
            guard let casted = entity as? Family else {return}
            guard casted.name != "" else {return}
            let uid = casted.id
            let parameters: Dictionary<String,Any> = ["name": casted.name,"members":casted.members]
            db.child(entityType.rawValue).child(uid).setValue(parameters)
            completion(true)
        case .Member:
            break
        }
    }
    
    func readValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping ([String]) -> ()) {
        ref?.child(entityType.rawValue).child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            // USE DECODER
            let value = snapshot.value as? NSDictionary
            guard let members = value!["members"] as? [String] else {return}
            completion(members)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ()) {
        switch entityType{
        case .Family:
            guard var casted = entity as? Family else {return}
            let parameters = ["uid": casted.id,
                              "name": casted.name,
                              "members": casted.members] as [String : Any]
            let db = ref?.child("Family/\(casted.id)")
            db?.updateChildValues(parameters)
            completion(true)
        case .Member:
            break
        }
    }
    
    func deleteValue(_ dataID: String,_ entityType: EntityTypes, completion: @escaping (Bool) -> ()) {
        switch entityType{
        case .Family:
            let db = ref?.child("family/\(dataID)")
            db?.removeValue()
        case .Member:
            break
        }
    }
    
}

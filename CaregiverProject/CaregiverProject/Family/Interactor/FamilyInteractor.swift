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
    
    func addValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
    func readValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Family) -> ())
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
}


class FamilyInteractor:  FamilyInteractorProtocol{
    
    private let ref: DatabaseReference?
    
    init(database: Database){
        self.ref = database.reference()
    }
    
    func addValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ()) {
        guard let db = ref else {return}
        switch entityType{
        case .Family:
            guard let casted = entity as? Family else {return}
            let uid = casted.id
            let parameters: Dictionary<String,Any> = ["name": casted.name,"members":casted.members]
            db.child(entityType.rawValue).child(uid).setValue(parameters)
        case .Member:
            break
        }
    }
    
    func readValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Family) -> ()) {
        // Websocket type
        //        _ = self.ref?.observe(DataEventType.value, with: { (snapshot) in
        //            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        //            completion(postDict)
        //        })
        
        ref?.child(entityType.rawValue).child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            // USE DECODER
            let value = snapshot.value as? NSDictionary
            print(value)
            guard let id = value?["uid"] as? String else {return}
            guard let name = value!["name"] as? String else {return}
            guard let members = value!["members"] as? [String] else {return}
            let family =  Family(id: id, name: name, members: members)
            completion(family)
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }
    
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ()) {
        switch entityType{
        case .Family:
            guard let casted = entity as? Family else {return}
            let parameters = ["uid": casted.id,
                              "name": casted.name,
                              "members": casted.members] as [String : Any]
            let db = ref?.child("family/\(casted.id)")
            db?.updateChildValues(parameters)
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

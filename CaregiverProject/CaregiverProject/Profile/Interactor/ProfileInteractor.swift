//
//  ProfileInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit
import Firebase

protocol ProfileInteractorLogic{
    var ref: DatabaseReference? {get}
    func addValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ())
    func readValue(_ dataID: String,completion: @escaping (ProfileEntity) -> ())
    func updateValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ())
}

class ProfileInteractor: ProfileInteractorLogic{
    
    internal let ref: DatabaseReference?
    
    init(database: Database){
        self.ref = database.reference()
    }
    
    func addValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ()) {
        guard let db = ref else {return}
        guard let casted = entity as? ProfileEntity else {return}
        guard casted.name != "" else {return}
        
        let uid = casted.id
        let parameters: Dictionary<String,Any> = ["name": casted.name,"age":casted.age,"photo":casted.photo,"notes":casted.notes,"kinship":casted.kinship]
        db.child("ElderProfile").child(uid).setValue(parameters)
        completion(true)
    }
    
    
    func readValue(_ dataID: String,completion: @escaping (ProfileEntity) -> ()) {
        ref?.child("ElderProfile").child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard let profile = value?["ElderProfile"] as? ProfileEntity else {return}
            completion(profile)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func updateValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ()) {
        guard let casted = entity as? ProfileEntity else {return}
        let parameters = ["uid": casted.id,
                          "name": casted.name,
                          "age": casted.age,
                          "photo": casted.photo,
                          "notes": casted.notes,
                          "kinship": casted.kinship] as [String : Any]
        let db = ref?.child("ElderProfile/\(casted.id)")
        db?.updateChildValues(parameters)
        completion(true)
    }
    
    func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ()) {
        let db = ref?.child("ElderProfile/\(dataID)")
        db?.removeValue()
        completion(true)
        
    }
}

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
    func readValue(_ dataID: String,completion: @escaping (ProfileModel) -> ())
    func updateValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ())
}

class ProfileViewModel: ProfileInteractorLogic{
    
    var entity: ProfileModel?
    internal let ref: DatabaseReference?
    private let imgConverter = ImageConverter()
    
    init(database: Database){
        self.ref = database.reference()
    }
    
    func assignEntity(entityID: String,completion: @escaping () -> ()) {
        readValue(entityID) { (value) in
            print(value)
            self.entity = value
            completion()
        }
    }
    
    func manageEntity<T>(entity: ModelProtocol,intendedReturn: T.Type,operation: CRUDOperations, completion: @escaping (T?) -> ()) {
        switch operation{
        case .create:
            addValue(entity) { (result) in
                completion(result as? T)
            }
        case .read:
            readValue(entity.id) { (result) in
                completion(result as? T)
            }
        case .update:
            updateValue(entity) { (result) in
                completion(result as? T)
            }
        case .delete:
            deleteValue(entity.id) { (result) in
                completion(result as? T)
            }
        }
    }
    
    internal func addValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ()) {
        guard let db = ref else {return}
        guard let casted = entity as? ProfileModel else {return}
        guard casted.name != "" else {return}
        
        let uid = casted.id
        let image64 = self.imgConverter.encodeImage(image: casted.photo)
        let parameters: Dictionary<String,Any> = ["name": casted.name,"age":casted.age,"photo":image64]
        db.child("ElderProfile").child(uid).setValue(parameters)
        completion(true)
    }
    
    
    internal func readValue(_ dataID: String,completion: @escaping (ProfileModel) -> ()) {
        ref?.child("ElderProfile").child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let stringPhoto = value?["photo"] as? String
            let photo = self.imgConverter.decodeImage(str64: stringPhoto)
            let profile = ProfileModel(id:  "",name: (value?["name"] as? String) ?? "Nome do Idoso", age: (value?["age"] as? Int) ?? 80,photo: photo)
            
            completion(profile)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    internal func updateValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ()) {
        guard let casted = entity as? ProfileModel else {return}
        let parameters = ["uid": casted.id,
                          "name": casted.name,
                          "age": casted.age,
                          "photo": casted.photo ?? UIImage(named: "profileIcon")!] as [String : Any]
        let db = ref?.child("ElderProfile/\(casted.id)")
        db?.updateChildValues(parameters)
        completion(true)
    }
    
    internal func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ()) {
        let db = ref?.child("ElderProfile/\(dataID)")
        db?.removeValue()
        completion(true)
        
    }
}

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
        let image64 = self.encodeImage(image: casted.photo)
        let parameters: Dictionary<String,Any> = ["name": casted.name,"age":casted.age,"photo":image64]
        db.child("ElderProfile").child(uid).setValue(parameters)
        completion(true)
    }
    
    
    func readValue(_ dataID: String,completion: @escaping (ProfileEntity) -> ()) {
        ref?.child("ElderProfile").child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let stringPhoto = value?["photo"] as? String
            let photo = self.decodeImage(str64: stringPhoto)
            let profile = ProfileEntity(id:  "",name: (value?["name"] as? String) ?? "Undefined", age: (value?["age"] as? Int) ?? 0,photo: photo)
                        
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
                          "photo": casted.photo ?? UIImage(named: "profileIcon")!] as [String : Any]
        let db = ref?.child("ElderProfile/\(casted.id)")
        db?.updateChildValues(parameters)
        completion(true)
    }
    
    func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ()) {
        let db = ref?.child("ElderProfile/\(dataID)")
        db?.removeValue()
        completion(true)
        
    }
    
    func encodeImage(image: UIImage?) -> String {
        //Now use image to create into NSData format
        guard let image = image else { return "" }
        let imageData = image.jpegData(compressionQuality: 0.5)
        let str64 = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        return str64 ?? ""
    }
    
    func decodeImage(str64: String?) -> UIImage? {
        guard let str64 = str64 else { return nil }
        
        let dataDecoded : Data = Data(base64Encoded: str64, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        return decodedimage
    }
    
}

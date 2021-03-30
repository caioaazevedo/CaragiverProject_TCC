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
    func readValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Any) -> ())
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
}


class FamilyInteractor:  FamilyInteractorProtocol{
    
    internal let ref: DatabaseReference?
    let imgConverter = ImageConverter()
    
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
            let elderID = UUID().uuidString
            let parameters: Dictionary<String,Any> = ["name": casted.name,"members":casted.members,"elderID":elderID]
            UserSession.shared.elderID = elderID
            db.child(entityType.rawValue).child(uid).setValue(parameters)
            completion(true)
        case .Member:
            break
        }
    }
    
    func readValue(_ dataID: String,_ entityType: EntityTypes,completion: @escaping (Any) -> ()) {
        ref?.child(entityType.rawValue).child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            // USE DECODER
            guard let value = snapshot.value as? NSDictionary else {return}
            switch entityType{
            case .Family:
                let name = value[""] as? String ?? ""
                let membersId = value["members"] as? [String] ?? [String]()
                let family = Family(id: dataID, name: name, members: membersId)
                UserSession.shared.elderID = value["elderID"] as? String
                completion(family)
            case .Member:
                let name = value["name"] as? String ?? ""
                let memberType = value["memberType"] as? Int ?? 0
                let imageString = value["image"] as? String
                let image = self.imgConverter.decodeImage(str64: imageString)
                let isAdmin = value["isAdmin"] as? Bool ?? false
                let member = Member(id: dataID, name: name, email: "", password: "", memberType: MemberType(rawValue: memberType) ?? .others, image: image, isAdmin: isAdmin)
                completion(member)
            }
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

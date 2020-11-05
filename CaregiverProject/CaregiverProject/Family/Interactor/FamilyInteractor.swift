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
    func readValue(_ dataID: String,completion: @escaping ([String:AnyObject]) -> ())
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ())
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
            let parameters: [String:Any] = ["name": casted.name,"members":casted.members]
            db.child(entityType.rawValue).child(uid).setValue(parameters) { result in
                completion(result)
            }
        case .Member:
            break
//            guard let casted = entity as? Member else {return} // Need to assign Member
//            guard let uid = casted.id else {return}
//            let parameters: [String:Any] = ["name": casted.name,"isAdmin":casted.isAdmin]
//            db.child(entityType.rawValue).child(uid).setValue(parameters)
        }
    }
    
    func readValue(_ dataID: String,completion: @escaping ([String:AnyObject]) -> ()) {
        _ = self.ref?.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            completion(postDict)
        })
        
    }
    
    func updateValue(_ entity: ModelProtocol,_ entityType: EntityTypes,completion: @escaping (Bool) -> ()) {
        guard let key = ref?.child(entityType.rawValue).childByAutoId().key else {return}
        switch entityType{
        case .Family:
            guard let casted = entity as? Family else {return}
            let parameters = ["uid": casted.id,
                              "name": casted.name,
                              "members": casted.members] as [String : Any]
            
            let childUpdates = ["/family/\(key)": parameters,
                                "/members/\(casted.id)/\(key)/": parameters]
            ref?.updateChildValues(childUpdates)
        case .Member:
            break
        }
    }
    
    func deleteValue(_ dataID: String, completion: @escaping (Bool) -> ()) {}
    
}

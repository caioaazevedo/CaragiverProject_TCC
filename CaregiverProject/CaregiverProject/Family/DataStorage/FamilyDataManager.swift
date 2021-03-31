//
//  FamilyDataManager.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class FamilyDataManager {
    private let ref: DatabaseReference?
    
    init(database: Database){
        self.ref = database.reference()
    }
}

extension FamilyDataManager: DataManager {
    func add(value: Storable, entityType: EntityTypes, completion: @escaping ValidationHandler) {
        guard let db = ref else {return}
        switch entityType{
        case .Family:
            let elderID = UUID().uuidString
            UserSession.shared.elderID = elderID
            var familyDict = value.convertToDictionary()
            familyDict["elderID"] = elderID
            db.child(entityType.rawValue).child(value.id).setValue(familyDict)
            completion(true)
        case .Member:
            break
        }
    }
    
    func deleteValue(by dataID: String, entityType: EntityTypes, completion: @escaping ValidationHandler) {
        let db = ref?.child("\(entityType.rawValue)/\(dataID)")
        db?.removeValue()
    }
    
    func readValue<ModelType: Storable>(
        from dataID: String,
        queryValue: EntityTypes,
        resutlType: ModelType.Type,
        completion: @escaping (Result<ModelType, Error>) -> Void) {
        
        ref?.child(queryValue.rawValue).child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? NSDictionary else { return }
            let model = ModelType(id: dataID, dictionary: dictionary)
            completion(.success(model))
        }) { (error) in
            completion(.failure(error))
        }
    }
    
    func update(value: Storable, entityType: EntityTypes, completion: @escaping ValidationHandler) {
        let parameters = value.convertToDictionary()
        let db = ref?.child("\(entityType.rawValue)/\(value.id)")
        db?.updateChildValues(parameters)
        completion(true)
    }
}

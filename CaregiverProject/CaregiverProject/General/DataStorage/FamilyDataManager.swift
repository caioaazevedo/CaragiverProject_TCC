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
    func add<ModelType: Storable>(value: ModelType, completion: @escaping ValidationHandler) {
        guard let db = ref else {return}
        let parameter = value.convertToDictionary()
        db.child(ModelType.queryValue).child(value.id).setValue(parameter)
        completion(true)
    }
    
    func deleteValue(by dataID: String, entityType: EntityTypes, completion: @escaping ValidationHandler) {
        let db = ref?.child("\(entityType.rawValue)/\(dataID)")
        db?.removeValue()
    }
    
    func readValue<ModelType: Storable>(
        from dataID: String,
        resutlType: ModelType.Type,
        completion: @escaping (Result<ModelType, Error>) -> Void) {
        
        ref?.child(ModelType.queryValue).child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? NSDictionary else { return }
            let model = ModelType(id: dataID, dictionary: dictionary)
            completion(.success(model))
        }) { (error) in
            completion(.failure(error))
        }
    }
    
    func update<ModelType: Storable>(value: ModelType, completion: @escaping ValidationHandler) {
        let parameters = value.convertToDictionary()
        let db = ref?.child("\(ModelType.queryValue)/\(value.id)")
        db?.updateChildValues(parameters)
        completion(true)
    }
}

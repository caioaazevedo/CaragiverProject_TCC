//
//  FamilyDataManager.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation
import Combine
import Firebase
import FirebaseDatabase

class FamilyDataManager {
    private let ref: DatabaseReference?
    
    init(database: Database = Database.database()){
        self.ref = database.reference()
    }
}

extension FamilyDataManager: DataManager {
    func add<ModelType: Storable>(value: ModelType, completion: @escaping ValidationHandler) {
        guard let db = ref else {return}
        let parameter = value.convertedDictionary
        db.child(ModelType.queryValue).child(value.id).setValue(parameter)
        completion(true)
    }
    
    func deleteValue(by dataID: String, entityType: EntityTypes, completion: @escaping ValidationHandler) {
        let db = ref?.child("\(entityType.rawValue)/\(dataID)")
        db?.removeValue()
    }
    
    func readValue<ModelType: Storable>(from dataID: String, resutlType: ModelType.Type) -> AnyPublisher<ModelType, Error> {
        return Future<ModelType, Error> { [ref] promise in
            ref?.child(ModelType.queryValue).child(dataID).observeSingleEvent(of: .value, with: { (snapshot) in
                guard let dictionary = snapshot.value as? NSDictionary else {
                    promise(.failure(DataManagerError.invalidDate(title: "Error!", description: "The token is invalid.")))
                    return
                }
                let model = ModelType(id: dataID, dictionary: dictionary)
                promise(.success(model))
            }) { (error) in
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
    
    func update<ModelType: Storable>(value: ModelType, completion: @escaping ValidationHandler) {
        let parameters = value.convertedDictionary
        let db = ref?.child("\(ModelType.queryValue)/\(value.id)")
        db?.updateChildValues(parameters)
        completion(true)
    }
}

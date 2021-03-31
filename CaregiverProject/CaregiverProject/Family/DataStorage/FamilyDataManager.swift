//
//  FamilyDataManager.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation

protocol DataManager {
    typealias ValidationHandler = (Bool) -> Void
    func add(value: Storable, entityType: EntityTypes, completion: @escaping ValidationHandler)
    func readValue<ModelType: Storable>(
        from dataID: String,
        queryValue: EntityTypes,
        resutlType: ModelType.Type,
        completion: @escaping (ModelType?) -> Void
    )
    func update(value: Storable, completion: @escaping ValidationHandler)
    func deleteValue(by dataID: String, entityType: EntityTypes, completion: @escaping ValidationHandler)
}

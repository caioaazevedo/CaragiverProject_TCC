//
//  DataManager.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation
import Combine

protocol DataManager {
    typealias ValidationHandler = (Bool) -> Void
    func add<ModelType: Storable>(value: ModelType, completion: @escaping ValidationHandler)
    func readValue<ModelType: Storable>(from dataID: String, resutlType: ModelType.Type) -> AnyPublisher<ModelType, Error>
    func update<ModelType: Storable>(value: ModelType, completion: @escaping ValidationHandler)
    func deleteValue(by dataID: String, entityType: EntityTypes, completion: @escaping ValidationHandler)
}

//
//  EventWrapper.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 30/04/21.
//

import Foundation

struct Wrapper<ModelType: Storable> {
    var id: String
    let values: [ModelType]
}

extension Wrapper: Storable {
    static var queryValue: String {
        ModelType.queryValue
    }
    
    var convertedDictionary: [String : Any] {
        var valuesDict = [String: Any]()
        values.forEach { value in
            let valueDict = value.convertedDictionary
            let newID = UUID().uuidString
            valuesDict[newID] = valueDict
        }
        return valuesDict
    }
    
    init(id: String, dictionary: NSDictionary) {
        var values = [ModelType]()
        self.id = id
        dictionary.allKeys.forEach { valueID in
            if let idString = valueID as? String,
               let valueDict = dictionary[idString] as? NSDictionary {
                let value = ModelType(id: idString, dictionary: valueDict)
                values.append(value)
            }
        }
        self.values = values
    }
}

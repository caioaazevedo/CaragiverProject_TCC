//
//  Family.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

typealias Families = [Family]

protocol ModelProtocol{
    // change to UUID
    var id: String {get}
}
struct Family: ModelProtocol {
    var id: String
    let name: String
    // Going to change to get reference
    var members: [String]
}

extension Family: Storable {
    init(id: String, dictionary: [String : Any]) {
        self.id = id
        self.name = dictionary["name"] as? String ?? ""
        self.members = dictionary["members"] as? [String] ?? []
        UserSession.shared.elderID = dictionary["elderID"] as? String
    }
    func convertToDictionary() -> [String : Any] {
        return [
            "name": name,
            "members": members,
            "uid": id,
        ]
    }
}

//
//  User.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit
typealias Members = [Member]

struct Member: ModelProtocol {
    var id: String
    var name: String
    var email: String
    var password: String
    var memberType: MemberType
    var image: UIImage?
    var isAdmin: Bool = false
}

extension Member: Storable {
    static var queryValue: String {
        EntityTypes.Member.rawValue
    }
    
    init(id: String, dictionary: NSDictionary) {
        let memberTypeValue = dictionary["memberType"] as? Int ?? 0
        let imageString =     dictionary["image"] as? String
        self.id =             id
        self.name =           dictionary["name"] as? String ?? ""
        self.memberType =     MemberType(rawValue: memberTypeValue) ?? .others
        self.image =          imageString?.decodedImage()
        self.isAdmin =        dictionary["isAdmin"] as? Bool ?? false
        self.email =          ""
        self.password =       ""
    }
    
    func convertToDictionary() -> [String: Any] {
        let imageString = image?.encode() ?? ""
        return [
            "name": name,
            "image": imageString,
            "memberType": memberType,
            "isAdmin": isAdmin,
            "uid": id
        ]
    }
}

extension Member: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.id == rhs.id
    }
}

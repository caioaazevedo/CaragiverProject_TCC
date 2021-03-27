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

extension Member: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
    
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.id == rhs.id
    }
    
}

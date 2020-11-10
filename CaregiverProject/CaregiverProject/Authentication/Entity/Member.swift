//
//  User.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import Foundation

// Relationship
enum MemberType: Int {
    case husband_wife = 0
    case son_daughter
    case grandson_granddaughter
    case others
}

struct Member {
    var id: String?
    var name: String
    var email: String
    var password: String
    var type: MemberType
    var isAdmin: Bool = false
}

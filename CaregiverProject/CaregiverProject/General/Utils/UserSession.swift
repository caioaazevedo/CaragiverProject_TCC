//
//  UserSession.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/11/20.
//

import Foundation

struct UserSession: Codable{
    
    var id: String?
    var username: String?
    var familyID: String?
    var elderID: String?
    
}

extension UserSession{
    static var shared: UserSession = {
        let session = UserSession()
        return session
    }()
}

//
//  UserSession.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/11/20.
//

import Foundation

struct UserSession{
    
    var id: String?
    var username: String?
    var familyID: String?
    var elderID: String?
    
    static var shared: UserSession = {
        let session = UserSession()
        return session
    }()
}

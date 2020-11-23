//
//  UserDefaultsExtension.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 11/11/20.
//

import Foundation

extension UserDefaults {
    static var userAlreadyLogged: Bool {
        get {
            let result = standard.value(forKey: "alreadyLogged") as? Bool ?? false
            if result{
                if let user = userSession{
                    UserSession.shared = user
                }
            }
            return result
        }
        set {
            standard.setValue(newValue, forKey: "alreadyLogged")
            if newValue{
                userSession = UserSession.shared
            }
        }
    }
    
    static var userSession: UserSession?{
        get {
            if let data = standard.value(forKey: "user") as? Data{
                let userSession = try? PropertyListDecoder().decode(UserSession.self, from: data)
                return userSession
            }
            return nil
        }
        set {
            if let value = newValue{
                standard.setValue(try? PropertyListEncoder().encode(value), forKey: "user")
            }
        }
    }
}

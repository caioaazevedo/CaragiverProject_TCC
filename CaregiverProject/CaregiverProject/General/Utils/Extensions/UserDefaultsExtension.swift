//
//  UserDefaultsExtension.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 11/11/20.
//

import Foundation

enum LoginState: Int{
    case firstTimer = 0
    case alreadyLogged = 1
    case enteredFamily = 2
}

extension UserDefaults {
    static var loginState: LoginState {
        get {
            if let user = userSession { UserSession.shared = user }
            let stateValue = standard.value(forKey: "loginState") as? Int ?? 0
            if let loginState = LoginState(rawValue: stateValue){
                return loginState
            }
            return LoginState.firstTimer
        }
        set {
            userSession = UserSession.shared
            let value = newValue.rawValue
            standard.setValue(value, forKey: "loginState")
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

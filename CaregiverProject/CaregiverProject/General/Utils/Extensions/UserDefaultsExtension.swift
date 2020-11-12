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
            UserDefaults.standard.value(forKey: "alreadyLogged") as? Bool ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "alreadyLogged")
        }
    }
}

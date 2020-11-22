//
//  ErrorHandler.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 20/11/20.
//

import Firebase

struct ErrorHandler {
    func handler(_ error: Error) -> String {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .networkError:
                return ErrorMessages.FIRAuthErrorCodeNetworkError.description
            case .invalidEmail:
                return ErrorMessages.FIRAuthErrorCodeInvalidEmail.description
            case .userNotFound:
                return ErrorMessages.FIRAuthErrorCodeUserNotFound.description
            case .emailAlreadyInUse:
                return ErrorMessages.FIRAuthErrorCodeEmailAlreadyInUse.description
            case .wrongPassword:
                return ErrorMessages.FIRAuthErrorCodeWrongPassword.description
            case .weakPassword:
                return ErrorMessages.FIRAuthErrorCodeWeakPassword.description
            default:
                return ErrorMessages.FIRAuthErrorGeneric.description
            }
        }
        
        return ""
    }
}

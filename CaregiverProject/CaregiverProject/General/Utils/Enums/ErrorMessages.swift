//
//  ErrorHandler.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 20/11/20.
//

import Firebase

enum ErrorMessages {
    case FIRAuthErrorCodeInvalidEmail
    case FIRAuthErrorCodeEmailAlreadyInUse
    case FIRAuthErrorCodeWrongPassword
    case FIRAuthErrorCodeWeakPassword
    case FIRAuthErrorCodeNetworkError
    case FIRAuthErrorCodeUserNotFound
    case FIRAuthErrorGeneric
    
    case NameIsEmptyError
    case RelatinshipIsEmptyError
    
    var description: String {
        switch self {
        case .FIRAuthErrorCodeNetworkError:
            return "A network error occurred during the operation."
        case .FIRAuthErrorCodeInvalidEmail:
            return "The email address you entered is incorrect."
        case .FIRAuthErrorCodeEmailAlreadyInUse:
            return "The email address you entered is already in use."
        case .FIRAuthErrorCodeWrongPassword:
            return "The password entered is incorrect."
        case .FIRAuthErrorCodeWeakPassword:
            return "Attempt to set a password that is considered too weak."
        case .FIRAuthErrorCodeUserNotFound:
            return "User Not Found."
        case .FIRAuthErrorGeneric:
            return "An error has ocurred."
        case .NameIsEmptyError:
            return "Your name cannot be empty."
        case .RelatinshipIsEmptyError:
            return "Your relationship with the Elder cannot be empty."
        }
    }
}

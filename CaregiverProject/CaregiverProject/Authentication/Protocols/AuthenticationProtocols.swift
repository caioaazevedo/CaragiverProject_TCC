//
//  AuthenticationProtocols.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 01/11/20.
//

import Foundation

protocol ViewToPresenterAuthenticationProtocol {
    var view: PresenterToViewAuthenticationProtocol? {get set}
    var interactor: PresenterToInteractorAuthenticationProtocol? {get set}
    var router: PresenterToRouterAuthenticationProtocol? {get set}
}

protocol PresenterToViewAuthenticationProtocol {
    
}

protocol PresenterToInteractorAuthenticationProtocol {
    
}

protocol InteractorToPresenterAuthenticationProtocol {
    
}

protocol PresenterToRouterAuthenticationProtocol {
    
}

//
//  AuthenticationProtocols.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 01/11/20.
//

import UIKit

protocol ViewToPresenterAuthenticationProtocol: class {
    var view: PresenterToViewAuthenticationProtocol? {get set}
    var interactor: PresenterToInteractorAuthenticationProtocol? {get set}
    var router: PresenterToRouterAuthenticationProtocol? {get set}
    func loginUser(email: String, password: String)
}

protocol PresenterToViewAuthenticationProtocol: class {
    func showError(errorMsg: String)
}

protocol PresenterToInteractorAuthenticationProtocol: class {
    var presenter: InteractorToPresenterAuthenticationProtocol? { get set }
    func authenticateUser(email: String, password: String)
    func addStateListener()
    func removeStateListener()
}

protocol InteractorToPresenterAuthenticationProtocol: class {
    func loginSucceded()
    func failedToLogin(error: Error)
}

protocol PresenterToRouterAuthenticationProtocol: class {
    static func createModule()-> AuthenticationViewController
    func pushToStartFamilyScreen() -> FamilyListViewController
    func pushToRegisterScreen()
}

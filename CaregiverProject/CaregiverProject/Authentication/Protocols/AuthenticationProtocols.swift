//
//  AuthenticationProtocols.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 01/11/20.
//

import UIKit

protocol ViewToPresenterAuthenticationProtocol: AnyObject {
    var view: PresenterToViewAuthenticationProtocol? {get set}
    var interactor: PresenterToInteractorAuthenticationProtocol? {get set}
    var router: PresenterToRouterAuthenticationProtocol? {get set}
    func presentRegister(vc: UIViewController)
    func presentLogin(vc: UIViewController)
    func loginUser(email: String, password: String)
}

protocol PresenterToViewAuthenticationProtocol: AnyObject {
    func performLogin()
    func showError(errorMsg: String)
}

protocol PresenterToInteractorAuthenticationProtocol: AnyObject {
    var presenter: InteractorToPresenterAuthenticationProtocol? { get set }
    func authenticateUser(email: String, password: String)
    func addStateListener()
    func removeStateListener()
}

protocol InteractorToPresenterAuthenticationProtocol: AnyObject {
    func loginSucceded()
    func failedToLogin(error: Error)
}

protocol PresenterToRouterAuthenticationProtocol: AnyObject {
    func showStartFamilyScreen()
    func presentRegisterScreen()
}

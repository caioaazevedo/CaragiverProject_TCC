//
//  RegisterProtocols.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import UIKit

protocol ViewToPresenterRegisterProtocol: AnyObject {
    var view: PresenterToViewRegisterProtocol? {get set}
    var interactor: PresenterToInteractorRegisterProtocol? {get set}
    var router: PresenterToRouterRegisterProtocol? {get set}
    func registerUser(member: Member)
    func presentFamily(vc: UIViewController)
}

protocol PresenterToViewRegisterProtocol: AnyObject {
    func registerSucceded()
    func showError(errorMsg: String)
}

protocol PresenterToInteractorRegisterProtocol: AnyObject {
    var presenter: InteractorToPresenterRegisterProtocol? { get set }
    func createUser(member: Member)
}

protocol InteractorToPresenterRegisterProtocol: AnyObject {
    func registerUserSucceded()
    func failedToRegister(error: Error)
}

protocol PresenterToRouterRegisterProtocol: AnyObject {
    func showStartFamilyScreen()
}

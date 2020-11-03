//
//  RegisterProtocols.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import UIKit

protocol ViewToPresenterRegisterProtocol: class {
    var view: PresenterToViewRegisterProtocol? {get set}
    var interactor: PresenterToInteractorRegisterProtocol? {get set}
    var router: PresenterToRouterRegisterProtocol? {get set}
    func registerUser(member: Member)
}

protocol PresenterToViewRegisterProtocol: class {
    func showError(errorMsg: String)
}

protocol PresenterToInteractorRegisterProtocol: class {
    var presenter: InteractorToPresenterRegisterProtocol? { get set }
    func createUser(member: Member)
}

protocol InteractorToPresenterRegisterProtocol: class {
    func registerUserSucceded()
    func failedToRegister(error: Error)
}

protocol PresenterToRouterRegisterProtocol: class {
    static func createModule()-> RegisterViewController
    func pushToStartFamilyScreen()
}

//
//  AutheticationPresenter.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import UIKit
import Firebase

class AuthenticationPresenter: ViewToPresenterAuthenticationProtocol{
    var view: PresenterToViewAuthenticationProtocol?
    
    var interactor: PresenterToInteractorAuthenticationProtocol?
    
    weak var router: PresenterToRouterAuthenticationProtocol?
    
    func presentRegister(vc: UIViewController) {
        router?.presentRegisterScreen()
    }
    
    func presentLogin(vc: UIViewController) {
        router?.showStartFamilyScreen()
    }
    
    func loginUser(email: String, password: String) {
        interactor?.authenticateUser(email: email, password: password)
    }
}

extension AuthenticationPresenter: InteractorToPresenterAuthenticationProtocol {
    func loginSucceded() {
        UserDefaults.loginState = .alreadyLogged
        view?.performLogin()
//        router?.pushToStartFamilyScreen()
    }
    
    func failedToLogin(error: Error) {
        view?.showError(errorMsg: ErrorHandler().handler(error))
    }
}

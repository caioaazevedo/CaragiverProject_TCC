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
    
    var router: PresenterToRouterAuthenticationProtocol?
    
    func loginUser(email: String, password: String) {
        interactor?.authenticateUser(email: email, password: password)
    }
}

extension AuthenticationPresenter: InteractorToPresenterAuthenticationProtocol {
    func loginSucceded() {
        UserDefaults.userAlreadyLogged = true
        view?.performLogin()
//        router?.pushToStartFamilyScreen()
    }
    
    func failedToLogin(error: Error) {
        view?.showError(errorMsg: ErrorHandler().handler(error))
    }
}

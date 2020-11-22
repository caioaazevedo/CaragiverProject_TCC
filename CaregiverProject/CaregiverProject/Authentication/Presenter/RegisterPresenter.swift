//
//  RegisterPresenter.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import Firebase

class RegisterPresenter: ViewToPresenterRegisterProtocol {
    var view: PresenterToViewRegisterProtocol?
    
    var interactor: PresenterToInteractorRegisterProtocol?
    
    var router: PresenterToRouterRegisterProtocol?
    
    func registerUser(member: Member) {
        interactor?.createUser(member: member)
    }
}

extension RegisterPresenter: InteractorToPresenterRegisterProtocol {
    func registerUserSucceded() {
        view?.registerSucceded()
    }
    
    func failedToRegister(error: Error) {
        view?.showError(errorMsg: ErrorHandler().handler(error))
    }
}

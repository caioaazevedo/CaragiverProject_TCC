//
//  AuthenticationBuilder.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import Foundation

struct AuthenticationBuilder {
    func createAuthenticationModule() -> AuthenticationViewController {
        let view = AuthenticationViewController()
        let presenter: ViewToPresenterAuthenticationProtocol & InteractorToPresenterAuthenticationProtocol = AuthenticationPresenter()
        let interactor: PresenterToInteractorAuthenticationProtocol = AuthenticationInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func createRegisterModule() -> RegisterViewController {
        let view = RegisterViewController()
        let presenter: ViewToPresenterRegisterProtocol & InteractorToPresenterRegisterProtocol = RegisterPresenter()
        let interactor: PresenterToInteractorRegisterProtocol = RegisterInteractor()
        let router: PresenterToRouterRegisterProtocol = RegisterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

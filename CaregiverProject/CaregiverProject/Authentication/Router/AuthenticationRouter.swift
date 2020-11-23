//
//  AuthenticationRouter.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import UIKit

class AuthenticationRouter: PresenterToRouterAuthenticationProtocol {
    
    static func createModule() -> AuthenticationViewController {
        let view = AuthenticationViewController()
        let presenter: ViewToPresenterAuthenticationProtocol & InteractorToPresenterAuthenticationProtocol = AuthenticationPresenter()
        let interactor: PresenterToInteractorAuthenticationProtocol = AuthenticationInteractor()
        let router: PresenterToRouterAuthenticationProtocol = AuthenticationRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToStartFamilyScreen(vc: UIViewController){
        let viewController = StartFamilyViewController()
        viewController.modalPresentationStyle = .fullScreen
        vc.present(viewController, animated: true, completion: nil)
    }
    
    func pushToRegisterScreen(vc: UIViewController) {
        let viewController = RegisterRouter.createModule()
        viewController.modalPresentationStyle = .fullScreen
        vc.present(viewController, animated: true, completion: nil)
    }
}

//
//  RegisterRouter.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import UIKit

class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule() -> RegisterViewController {
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
    
    func pushToStartFamilyScreen(vc: UIViewController) {
        let viewController = StartFamilyViewController()
        viewController.modalPresentationStyle = .fullScreen
        vc.present(viewController, animated: true, completion: nil)
    }
}

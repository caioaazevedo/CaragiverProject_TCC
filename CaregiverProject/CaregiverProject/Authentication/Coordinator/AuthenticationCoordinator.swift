//
//  AuthenticationCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    private let builder = AuthenticationBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let authenticationViewController = builder.createAuthenticationModule()
        authenticationViewController.presenter?.router = self
        navigationController.show(authenticationViewController, sender: nil)
    }
}

extension AuthenticationCoordinator: PresenterToRouterRegisterProtocol {
    func showStartFamilyScreen(){
        navigationController.dismiss(animated: true)
        let coordinator = GroupManagementCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}

extension AuthenticationCoordinator: PresenterToRouterAuthenticationProtocol {
    func presentRegisterScreen() {
        let viewController = builder.createRegisterModule()
        viewController.presenter?.router = self
        navigationController.present(viewController, animated: true)
    }
}



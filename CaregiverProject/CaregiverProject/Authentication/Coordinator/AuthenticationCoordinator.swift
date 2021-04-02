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
        navigationController.pushViewController(authenticationViewController, animated: true)
    }
}

extension AuthenticationCoordinator: PresenterToRouterAuthenticationProtocol {
    func pushToStartFamilyScreen(){
        let viewController = StartFamilyViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pushToRegisterScreen() {
        let viewController = builder.createRegisterModule()
        navigationController.pushViewController(viewController, animated: true)
    }
}

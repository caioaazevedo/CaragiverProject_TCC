//
//  MainCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        switch UserDefaults.loginState {
        case .alreadyLogged:
            showGroupManagementView()
        case .enteredFamily:
            showFamilyTabBarView()
        case .firstTimer:
            showFamilyTabBarView()
        }
    }
    
    private func showAuthenticationView() {
        let authentication = AuthenticationRouter.createModule()
        navigationController.pushViewController(authentication, animated: true)
    }
    
    private func showGroupManagementView() {
        let startFamily = StartFamilyViewController()
        navigationController.pushViewController(startFamily, animated: true)
    }
    
    private func showFamilyTabBarView() {
        let familyTabBar = FamilyBuilder.buildFamilyTabBarController()
        navigationController.pushViewController(familyTabBar, animated: true)
    }
}

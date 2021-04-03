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
            showAuthenticationView()
        }
    }
    
    private func showAuthenticationView() {
        let coordinator = AuthenticationCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func showGroupManagementView() {
        let coordinator = GroupManagementCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func showFamilyTabBarView() {
        let tabBarController = MainTabBarController()
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([tabBarController], animated: true)
    }
}

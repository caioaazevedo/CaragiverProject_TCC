//
//  AppCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 04/04/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    lazy var childCoordinators: [Coordinator] = [
        FamilyCoordinator(navigationController: UINavigationController()),
        CalendarCoodinator(navigationController: UINavigationController()),
        ProfileCoodinator(navigationController: UINavigationController())
    ]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = childCoordinators.map { coordinator in
            coordinator.start()
            return coordinator.navigationController
        }
        navigationController.setViewControllers([tabBarController], animated: true)
    }
}

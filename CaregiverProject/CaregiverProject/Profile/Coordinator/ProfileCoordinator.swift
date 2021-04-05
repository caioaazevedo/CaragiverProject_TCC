//
//  ProfileCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit

class ProfileCoodinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    private let builder = ProfileBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let viewController = builder.setUpProfileModule()
        navigationController.setViewControllers([viewController], animated: true)
    }
}
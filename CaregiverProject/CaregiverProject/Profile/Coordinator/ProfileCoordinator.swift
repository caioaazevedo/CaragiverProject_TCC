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
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentTaskView() {
        let viewController = ActivityViewController()
        navigationController.present(viewController, animated: true)
    }
}

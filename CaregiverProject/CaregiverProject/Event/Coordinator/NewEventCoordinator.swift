//
//  NewEventCoordinator.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import Foundation

import UIKit

class NewEventCoodinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let viewController = NewEventViewController()
        navigationController.modalPresentationStyle = .automatic
        navigationController.present(viewController, animated: true)
    }
}

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
    var viewModel: EventViewModel
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
        self.viewModel = EventViewModel()
    }
    
    func start() {
        let viewController = NewEventViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.modalPresentationStyle = .automatic
        navigationController.present(viewController, animated: true)
    }
}

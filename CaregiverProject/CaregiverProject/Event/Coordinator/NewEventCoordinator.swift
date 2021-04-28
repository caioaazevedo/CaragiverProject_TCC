//
//  NewEventCoordinator.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

protocol NewEventCoodinatorDelegate: class {
    func didCreateEvent(event: EventModel)
}

class NewEventCoodinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var viewModel: EventViewModel
    var viewController: NewEventViewController
    weak var parentCoordinator: NewEventCoodinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
        self.viewModel = EventViewModel()
        self.viewController = NewEventViewController(viewModel: viewModel)
    }
    
    func start() {
        viewController.coordinator = self
        navigationController.modalPresentationStyle = .automatic
        navigationController.present(viewController, animated: true)
    }
    
    func didCreateEvent(event: EventModel) {
        parentCoordinator?.didCreateEvent(event: event)
        viewController.dismiss(animated: true, completion: nil)
    }
}

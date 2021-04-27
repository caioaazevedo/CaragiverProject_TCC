//
//  CalendarCoodinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit

class CalendarCoodinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    private let builder = CalendarBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let viewController = builder.setUpCalendarModule()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func createNewEvent() {
        let coordinator = NewEventCoodinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

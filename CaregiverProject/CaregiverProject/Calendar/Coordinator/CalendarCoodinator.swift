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
    var viewController: CalendarViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
        viewController = builder.setUpCalendarModule()
    }
    
    func start() {
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func createNewEvent() {
        let coordinator = NewEventCoodinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension CalendarCoodinator: NewEventCoodinatorDelegate {
    func didCreateEvent(event: EventModel) {
        viewController.addEvent(event: event)
    }
}

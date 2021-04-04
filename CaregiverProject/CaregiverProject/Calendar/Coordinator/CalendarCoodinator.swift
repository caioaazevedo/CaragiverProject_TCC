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
        navigationController.setViewControllers([viewController], animated: true)
    }
}

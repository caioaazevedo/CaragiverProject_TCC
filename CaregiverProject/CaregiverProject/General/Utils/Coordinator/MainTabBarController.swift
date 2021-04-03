//
//  MainTabBarController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var coordinators: [Coordinator] = [
        FamilyCoordinator(navigationController: UINavigationController()),
        CalendarCoodinator(navigationController: UINavigationController()),
        ProfileCoodinator(navigationController: UINavigationController())
    ]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = coordinators.map { coordinator in
            coordinator.start()
            return coordinator.navigationController
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

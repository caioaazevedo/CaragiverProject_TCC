//
//  LaunchCoordinator.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 03/05/21.
//

import UIKit
import Combine

class LaunchCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    private (set) var subject = PassthroughSubject<Bool, Never>()
    
    lazy var publisher: AnyPublisher<Bool, Never>? = {
        return subject.eraseToAnyPublisher()
    }()
        
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        self.publisher = subject.eraseToAnyPublisher()
        navigationController.navigationBar.isHidden = true
        
    }

    func start() {
        let launchViewController = LaunchScreenController()
        launchViewController.launchView.dismiss = {
            self.subject.send(true)
            launchViewController.removeFromParent()
        }
        navigationController.setViewControllers([launchViewController], animated: true)
//        navigationController.present(launchViewController, animated: true)
    }
}

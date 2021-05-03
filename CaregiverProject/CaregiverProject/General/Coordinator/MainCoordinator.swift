//
//  MainCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import UIKit
import Combine

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var subscriber: AnyCancellable?
    var dismissedLaunch = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if dismissedLaunch{
            switch UserDefaults.loginState {
            case .alreadyLogged:
                showGroupManagementView()
            case .enteredFamily:
                showFamilyTabBarView()
            case .firstTimer:
                showAuthenticationView()
            }
        } else {
            showLaunchView()
        }
    }
    
    private func showLaunchView(){
        let coordinator = LaunchCoordinator(navigationController: navigationController)
        
        self.subscriber = coordinator.publisher!
            .receive(on: DispatchQueue.main)
            .sink { [self] (value) in
                dismissedLaunch = value
                start()
            }
        
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func showAuthenticationView() {
        let coordinator = AuthenticationCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func showGroupManagementView() {
        let coordinator = GroupManagementCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func showFamilyTabBarView() {
        let coordinator = AppCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

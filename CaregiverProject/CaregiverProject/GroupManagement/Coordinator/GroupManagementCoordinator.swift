//
//  GroupManagementCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import UIKit

class GroupManagementCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    private let builder = GroupManagementBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.isHidden = false
    }
    
    func start() {
        let viewController = StartFamilyViewController()
        viewController.coordinator = self
        navigationController.show(viewController, sender: nil)
    }
}

extension GroupManagementCoordinator: StartFamilyCoordinator {
    func pushToFamilyManage(state: ManageState) {
        let viewController = builder.buildFamilyManage(state: state)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension GroupManagementCoordinator: FamilyManageCoordinator {
    func pushToFamilyModule() {
        let module = FamilyBuilder.buildFamilyTabBarController()
        navigationController.present(module, animated: true, completion: nil)
    }
}

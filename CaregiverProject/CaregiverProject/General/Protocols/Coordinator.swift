//
//  Coordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

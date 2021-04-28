//
//  FamilyCoordinator.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit

class FamilyCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    private let builder = FamilyBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        let viewController = builder.buildFamilyTreeModule()
        viewController.coordinator = self
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func presentInvitationView(id: String?) {
        if let familyID = id,
           let url = URL(string: "login://" + "\(familyID)") {
            
            let fullText = ["\(familyID) está te convidando para entrar no grupo. Token: \(url)."]
            let activityViewController = UIActivityViewController(
                activityItems: fullText as [Any],
                applicationActivities: nil
            )
            
            activityViewController.popoverPresentationController?.sourceView = navigationController.view
            activityViewController.excludedActivityTypes = [.print]
            navigationController.present(activityViewController, animated: true)
        }
    }
}

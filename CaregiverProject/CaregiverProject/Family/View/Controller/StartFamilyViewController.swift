//
//  StartFamilyViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit


class StartFamilyViewController: UIViewController {
    
    var startFamilyView = StartFamilyView()
    
    override func loadView() {
        view = startFamilyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    private func configureButtons(){
        startFamilyView.createFamilyButton.addAction(
            UIAction { [goToFamilyModule] _ in
                goToFamilyModule(.Create)
            },
            for: .touchUpInside
        )
        startFamilyView.joinFamilyButton.addAction(
            UIAction { [goToFamilyModule] _ in
                goToFamilyModule(.Join)
            },
            for: .touchUpInside
        )
    }
    
    private func goToFamilyModule(state: ManageState) {
        let viewController = FamilyBuilder.buildFamilyModule(state: state)
        self.present(viewController, animated: true, completion: nil)
    }
}

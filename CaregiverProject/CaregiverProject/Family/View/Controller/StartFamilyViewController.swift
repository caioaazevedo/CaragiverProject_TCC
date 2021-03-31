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
            UIAction { [goToFamilyManage] _ in
                goToFamilyManage(.Create)
            },
            for: .touchUpInside
        )
        startFamilyView.joinFamilyButton.addAction(
            UIAction { [goToFamilyManage] _ in
                goToFamilyManage(.Join)
            },
            for: .touchUpInside
        )
    }
    
    private func goToFamilyManage(state: ManageState) {
        let viewController = FamilyBuilder.buildFamilyModule(state: state)
        self.present(viewController, animated: true, completion: nil)
    }
}

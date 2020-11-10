//
//  StartFamilyViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit


class StartFamilyViewController: UIViewController, FamilyControllerLogic {
    
    var startFamilyView = StartFamilyView()
    
    override func loadView() {
        view = startFamilyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    func configureButtons(){
        startFamilyView.createFamilyButton.addTarget(self, action: #selector(createFamily), for: .touchUpInside)
        startFamilyView.joinFamilyButton.addTarget(self, action: #selector(joinFamily), for: .touchUpInside)
    }
    
    @objc func createFamily(){
        let registerView = FamilyBuilder.buildFamilyModule(state: .Create)
        self.present(registerView, animated: true, completion: nil)
        
    }
    
    @objc func joinFamily(){
        let loginView = FamilyBuilder.buildFamilyModule(state: .Join)
        self.present(loginView, animated: true, completion: nil)
    }
    
    
    
}

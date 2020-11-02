//
//  RegisterViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerView = RegisterView()
    
    override func loadView() {
        super.loadView()
        
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

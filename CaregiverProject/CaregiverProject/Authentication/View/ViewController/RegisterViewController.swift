//
//  RegisterViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerView = RegisterView()
    
    override func loadView() {
        super.loadView()
        
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    @objc func register() {
        let email = registerView.username.text!
        let password = registerView.password.text!
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let self = self else { return }
            
            if error != nil {
                self.registerView.feedBackLabel.text = String(describing: error)
            } else {
                self.dismiss(animated: true)
            }
        }
    }

}

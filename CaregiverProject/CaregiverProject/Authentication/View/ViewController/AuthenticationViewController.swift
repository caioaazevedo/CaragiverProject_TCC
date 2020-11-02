//
//  ViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 01/11/20.
//

import UIKit
import Firebase

class AuthenticationViewController: UIViewController {
    
    var loginView = LoginView()
    var handler: AuthStateDidChangeListenerHandle?
    
    override func loadView(){
        super.loadView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginView.signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        handler = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(handler!)
    }
    
    @objc func signIn() {
        let email = loginView.username.text!
        let password = loginView.password.text!
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if error != nil {
                self.loginView.feedBackLabel.isHidden = false
                self.loginView.feedBackLabel.text = String(describing: error)
            } else {
                self.present(StartFamilyViewController(), animated: true)
            }
        }
    }
    
    @objc func register() {
        self.present(RegisterViewController(), animated: true, completion: nil)
    }

}


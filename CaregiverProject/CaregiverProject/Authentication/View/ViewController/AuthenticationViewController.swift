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
        
    }
    
    @objc func register() {
        
    }

}


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
    var presenter: ViewToPresenterAuthenticationProtocol?
    
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
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    @objc func signIn() {
        let email = loginView.username.text!
        let password = loginView.password.text!
        
        presenter?.loginUser(email: email, password: password)
    }
    
    @objc func register() {
        self.present(RegisterRouter.createModule(), animated: true, completion: nil)
    }
}

extension AuthenticationViewController: PresenterToViewAuthenticationProtocol {
    func performLogin(){
        let viewController = StartFamilyViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func showError(errorMsg: String) {
        self.loginView.feedBackLabel.isHidden = false
        self.loginView.feedBackLabel.text = errorMsg
    }
}


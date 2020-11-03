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
    var presenter: ViewToPresenterRegisterProtocol?
    
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
        let member = Member(email: email, password: password)
        presenter?.registerUser(member: member)
    }

}

extension RegisterViewController: PresenterToViewRegisterProtocol {
    func showError(errorMsg: String) {
        self.registerView.feedBackLabel.text = errorMsg
    }
}

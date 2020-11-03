//
//  RegisterInteractor.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import Firebase

class RegisterInteractor: PresenterToInteractorRegisterProtocol {

    var presenter: InteractorToPresenterRegisterProtocol?
    
    func createUser(member: Member) {
        Auth.auth().createUser(withEmail: member.email, password: member.password) { (authResult, error) in
    
            guard let error = error else {
                self.presenter?.registerUserSucceded()
                return
            }
            
            self.presenter?.failedToRegister(error: error)
        }
    }
}

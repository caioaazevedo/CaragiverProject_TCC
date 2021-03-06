//
//  FirebaseInteractor.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import Firebase

class AuthenticationInteractor: PresenterToInteractorAuthenticationProtocol {
   
    var handler: AuthStateDidChangeListenerHandle?
    var presenter: InteractorToPresenterAuthenticationProtocol?
    
    func addStateListener() {
        handler = Auth.auth().addStateDidChangeListener({ (auth, user) in
            
        })
    }
    
    func removeStateListener() {
        Auth.auth().removeStateDidChangeListener(handler!)
    }
    
    func authenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            UserSession.shared.id = authResult?.user.uid
            guard let error = error else {
                UserSession.shared.username = authResult?.user.displayName
                self.presenter?.loginSucceded()
                return
            }
            
            self.presenter?.failedToLogin(error: error)
        }
    }
}

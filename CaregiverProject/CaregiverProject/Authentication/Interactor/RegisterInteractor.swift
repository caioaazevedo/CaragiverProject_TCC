//
//  RegisterInteractor.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 03/11/20.
//

import Firebase
import FirebaseDatabase

class RegisterInteractor: PresenterToInteractorRegisterProtocol {

    var presenter: InteractorToPresenterRegisterProtocol?
    let ref: DatabaseReference
    private let imgConverter = ImageConverter()
    
    init() {        
        self.ref = Database.database().reference()
    }
    
    func createUser(member: Member) {
        Auth.auth().createUser(withEmail: member.email, password: member.password) { (authResult, error) in
    
            guard let error = error else {
                
                let id = authResult?.user.uid
                let image64 = self.imgConverter.encodeImage(image: member.image)
                self.ref.child("member").child(id!).setValue(["name": member.name, "isAdmin": member.isAdmin, "memberType": member.memberType.type, "image": image64])
                UserSession.shared.username = member.name
                UserSession.shared.id = id
                self.presenter?.registerUserSucceded()
                return
            }
            print(error.localizedDescription)
            self.presenter?.failedToRegister(error: error)
        }
    }
}

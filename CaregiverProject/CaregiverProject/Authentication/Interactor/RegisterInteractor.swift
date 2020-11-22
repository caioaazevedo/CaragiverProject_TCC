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
    
    init() {        
        self.ref = Database.database().reference()
    }
    
    func createUser(member: Member) {
        Auth.auth().createUser(withEmail: member.email, password: member.password) { (authResult, error) in
    
            guard let error = error else {
                
                let id = authResult?.user.uid
                let image64 = self.encodeImage(image: member.image)
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
    
    func encodeImage(image: UIImage?) -> String {
        //Now use image to create into NSData format
        guard let image = image else { return "" }
        let imageData = image.jpegData(compressionQuality: 0.5)
        let str64 = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        return str64 ?? ""
    }
    
    func decodeImage(str64: String?) -> UIImage? {
        guard let str64 = str64 else { return nil }
        
        let dataDecoded : Data = Data(base64Encoded: str64, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        return decodedimage
    }
}

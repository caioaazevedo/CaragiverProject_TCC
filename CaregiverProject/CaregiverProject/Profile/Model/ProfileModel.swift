//
//  ElderEntity.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit


struct ProfileModel: ModelProtocol {
    var id: String
    var idCardNumber: String
    var name: String
    var age: String
    var bloodType: String
    var insurance: String
    var phoneNumber: String
    var photo: UIImage? = UIImage(named: "profileIcon")        
}

extension ProfileModel: Storable {
    static var queryValue: String {
        EntityTypes.Elder.rawValue
    }
    
    var convertedDictionary: [String : Any] {
        [
            "id": id,
            "name": name,
            "age": age,
            "bloodType": bloodType,
            "insurance": insurance,
            "phoneNumber": phoneNumber,
            "idCardNumber": idCardNumber,
            "photo": photo?.encode() ?? ""
        ]
    }
    
    init(id: String, dictionary: NSDictionary) {
        self.id = id
        self.name = dictionary["name"] as? String ?? "Elder"
        self.age = dictionary["age"] as? String ?? ""
        self.bloodType = dictionary["bloodType"] as? String ?? ""
        self.insurance = dictionary["insurance"] as? String ?? ""
        self.phoneNumber = dictionary["phoneNumber"] as? String ?? ""
        let imageString = dictionary["photo"] as? String
        self.idCardNumber = dictionary["idCardNumber"] as? String ?? ""
        self.photo = imageString?.decodedImage()
    }
}

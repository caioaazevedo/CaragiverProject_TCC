//
//  ElderEntity.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit


struct ProfileModel: ModelProtocol {
    var id: String
    var name: String
    var age: Int
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
            "photo": photo?.encode() ?? ""
        ]
    }
    
    init(id: String, dictionary: NSDictionary) {
        self.id = id
        self.name = dictionary["name"] as? String ?? "Elder"
        self.age = dictionary["age"] as? Int ?? 70
        let imageString = dictionary["photo"] as? String
        self.photo = imageString?.decodedImage()
    }
}

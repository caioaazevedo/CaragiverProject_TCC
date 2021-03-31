//
//  ElderEntity.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

struct ProfileEntity: ModelProtocol {
    var id: String
    var name: String
    var age: Int
    var photo: UIImage? = UIImage(named: "profileIcon")        
}

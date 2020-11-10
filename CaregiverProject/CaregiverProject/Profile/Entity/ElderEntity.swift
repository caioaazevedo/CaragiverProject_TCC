//
//  ElderEntity.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import Foundation

struct ProfileEntity: ModelProtocol{
    var id: String
    var name: String
    var age: Int
    var photo: Data
    var notes: String
    var kinship: Kinship
}

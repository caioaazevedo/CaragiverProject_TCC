//
//  Family.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

typealias Families = [Family]

protocol ModelProtocol{
    // change to UUID
    var id: String {get}
}
struct Family: ModelProtocol{
    let id: String
    let name: String
    // Going to change to get reference
    var members: [String]
}



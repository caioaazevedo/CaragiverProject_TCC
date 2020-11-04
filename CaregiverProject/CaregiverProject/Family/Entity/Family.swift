//
//  Family.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

typealias Families = [Family]

protocol ModelProtocol{
    var id: UUID {get}
}
struct Family: ModelProtocol{
    let id: UUID
    let name: String
    var members: [Member]
}



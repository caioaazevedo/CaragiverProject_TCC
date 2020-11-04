//
//  Family.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

typealias Families = [Family]

struct Family{
    let id: UUID
    let name: String
    var members: [Member]
}



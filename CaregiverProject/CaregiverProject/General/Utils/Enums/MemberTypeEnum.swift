//
//  MemberTypeEnum.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 11/11/20.
//

import Foundation

// Relationship
enum MemberType: Int, CaseIterable {
    case husband_wife = 0
    case son_daughter = 1
    case grandson_granddaughter = 2
    case others = 3
    
    var type: Int {
        switch self {
        case .husband_wife:
            return 0
        case .son_daughter:
            return 1
        case .grandson_granddaughter:
            return 2
        case .others:
            return 3
        }
    }
    
    var title: String {
        switch self {
        case .husband_wife:
            return "Husband or Wife"
        case .son_daughter:
            return "Son or Daughter"
        case .grandson_granddaughter:
            return "Grandson or Granddaughter"
        case .others:
            return "Others"
        }
    }
}

//
//  MemberTypeEnum.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 11/11/20.
//

import Foundation

// Relationship
enum MemberType {
    case husband_wife
    case son_daughter
    case grandson_granddaughter
    case others
    
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

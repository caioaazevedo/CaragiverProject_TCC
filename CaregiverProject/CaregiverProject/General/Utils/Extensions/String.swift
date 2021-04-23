//
//  String.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 23/04/21.
//

import Foundation

extension String {
    var familyId: String {
        replacingOccurrences(of: "login://", with: "")
    }
}

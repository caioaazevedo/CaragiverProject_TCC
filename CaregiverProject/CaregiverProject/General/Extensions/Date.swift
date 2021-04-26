//
//  Date.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/04/21.
//

import Foundation

extension Date {
   func getFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "hh:mm"
        return dateformat.string(from: self)
    }
}

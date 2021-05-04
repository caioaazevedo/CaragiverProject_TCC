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
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: self).uppercased()
    }
}

extension String {
    func formatToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.date(from: self)
    }
}

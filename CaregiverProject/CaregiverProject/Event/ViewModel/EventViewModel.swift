//
//  NewEventViewModel.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import Foundation

class EventViewModel {
    var event: EventModel
    
    init() {
        self.event = EventModel()
        self.event.time = Date().addingTimeInterval(3600).getFormattedDate()
    }
    
    func validateEvent() -> Bool {
        if event.title?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            return false
        }
        
        if event.responsible?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            return false
        }
        
        return true
    }
}

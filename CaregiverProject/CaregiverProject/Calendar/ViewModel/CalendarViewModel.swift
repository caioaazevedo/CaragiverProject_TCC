//
//  CalendarViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 29/04/21.
//

import Combine
import Foundation

enum CalendarError: Error {
    case DateNodeValid(title: String, description: String)
}

class CalendarViewModel {
    @Published var eventList = [EventModel]()
    var eventBackUp = [EventModel]() {
        didSet { eventList = eventBackUp }
    }
    private let dataManager: DataManager
    
    private var familyID: String? {
        UserSession.shared.familyID
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchEvents(at date: Date) {
        guard let id = familyID else { return }
        dataManager.readValue(from: id, resutlType: Wrapper<EventModel>.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] wrapper in
                    self?.eventBackUp = wrapper.values
                    self?.filterEvents(by: date)
                }
            ))
    }
    
    func updateEvent(_ editedEvent: EventModel, completion: @escaping ()->()) {
        dataManager.update(value: editedEvent) { result in
            completion()
            return
        }
    }
    
    func filterEvents(by date: Date) {
        eventList = eventBackUp.filter { $0.date == date }
    }
    
    func validate(date: Date) throws {
        let today = Date()
        if today.formatDate() != date.formatDate() && date <= today {
            throw CalendarError.DateNodeValid(title: "Error!", description: "Date Invalid!")
        }
    }
    
    func addEvent(_ event: EventModel) {
        guard let id = familyID else { return }
        eventBackUp.append(event)
        let wrapper = Wrapper<EventModel>(
            id: id,
            values: eventBackUp
        )
        dataManager.add(value: wrapper) { _ in }
    }
}

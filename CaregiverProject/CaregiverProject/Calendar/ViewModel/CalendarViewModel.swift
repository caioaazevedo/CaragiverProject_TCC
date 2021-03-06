//
//  CalendarViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 29/04/21.
//

import Combine
import Foundation

enum DataManagerError: Error {
    case invalidDate(title: String, description: String)
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
    
    func filterEvents(by date: Date) {
        eventList = eventBackUp.filter { $0.date?.formatDate() == date.formatDate() }
    }
    
    func validate(date: Date) throws {
        let today = Date()
        if today.formatDate() != date.formatDate() && date <= today {
            throw DataManagerError.invalidDate(title: "Error!", description: "Date Invalid!")
        }
    }
    
    func addEvent(_ event: EventModel) {
        eventBackUp.append(event)
        uploadEvents()
    }
    
    func updateEvent(_ editedEvent: EventModel) {
        if let eventIndex = eventBackUp.firstIndex(where: { $0.id == editedEvent.id }) {
            eventBackUp[eventIndex] = editedEvent
            uploadEvents()
        }
    }
    
    func deleteEvent(_ event: EventModel) {
        if let eventIndex = eventBackUp.firstIndex(where: { $0.id == event.id }) {
            eventBackUp.remove(at: eventIndex)
            uploadEvents()
        }
    }
}

//MARK: -Data Base
extension CalendarViewModel {
    func fetchEvents(at date: Date, completion: (()->())?) {
        guard let id = familyID else { return }
        dataManager.readValue(from: id, resutlType: Wrapper<EventModel>.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] wrapper in
                    self?.eventBackUp = wrapper.values
                    self?.filterEvents(by: date)
                    completion?()
                }
            ))
    }
    
    private func uploadEvents() {
        guard let id = familyID else { return }
        let wrapper = Wrapper<EventModel>(
            id: id,
            values: eventBackUp
        )
        dataManager.add(value: wrapper) { _ in }
    }
}

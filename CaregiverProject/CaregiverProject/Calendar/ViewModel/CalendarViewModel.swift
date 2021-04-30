//
//  CalendarViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 29/04/21.
//

import Combine
import Foundation

class CalendarViewModel {
    @Published var eventList = [EventModel]()
    private let dataManager: DataManager
    
    private var familyID: String? {
        UserSession.shared.familyID
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchEvents() {
        guard let id = familyID else { return }
        dataManager.readValue(from: id, resutlType: Wrapper<EventModel>.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] wrapper in
                    self?.eventList = wrapper.values
                }
            ))
    }
    
    func addEvent(_ event: EventModel) {
        guard let id = familyID else { return }
        eventList.append(event)
        let wrapper = Wrapper<EventModel>(
            id: id,
            values: eventList
        )
        dataManager.add(value: wrapper) { _ in }
    }
}

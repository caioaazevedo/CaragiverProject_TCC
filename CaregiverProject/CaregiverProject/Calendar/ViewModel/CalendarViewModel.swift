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
    private var uniqueEvents = Set<EventModel>() {
        didSet { eventList = uniqueEvents.map { $0 } }
    }
    private let dataManager: DataManager
    
    private var familyID: String? {
        UserSession.shared.familyID
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchData() {
        uniqueEvents.removeAll()
        fetchFamily()
    }
    
    func addEvent(_ event: EventModel) {
        dataManager.add(value: event) { _ in }
    }
}

private extension CalendarViewModel {
    func fetchFamily() {
        guard let id = familyID else { return }
        dataManager.readValue(from: id, resutlType: Family.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [fetchEvent] family in
                    family.members.forEach { fetchEvent($0) }
                }
            ))
    }
    
    func fetchEvent(by id: String) {
        dataManager.readValue(from: id, resutlType: EventModel.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] event in
                    self?.uniqueEvents.insert(event)
                }
            ))
    }
}

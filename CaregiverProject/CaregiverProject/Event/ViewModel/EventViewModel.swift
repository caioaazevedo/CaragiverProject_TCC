//
//  NewEventViewModel.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import Foundation
import Combine

class EventViewModel {
    var event: EventModel
    @Published var members = Members()
    private var uniqueMembers = Set<Member>() {
        didSet { members = uniqueMembers.map { $0 } }
    }
    private let dataManager: DataManager
    private var familyID: String? {
        UserSession.shared.familyID
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        self.event = EventModel()
        self.event.time = Date().addingTimeInterval(3600).getFormattedDate()
    }
    
    func validateEvent() -> Bool {
        if event.title?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            return false
        }
        
        if event.responsible?.name.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            return false
        }
        
        return true
    }
    
    func fetchMembers() {
        guard let id = familyID else { return }
        dataManager.readValue(from: id, resutlType: Family.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [fetchEachMember] family in
                    family.members.forEach { fetchEachMember($0) }
                }
            ))
    }
    
    private func fetchEachMember(by id: String) {
        dataManager.readValue(from: id, resutlType: Member.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] member in
                    self?.uniqueMembers.insert(member)
                }
            ))
    }
}

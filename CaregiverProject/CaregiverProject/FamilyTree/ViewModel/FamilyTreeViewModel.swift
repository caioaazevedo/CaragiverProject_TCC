//
//  ViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 27/03/21.
//

import Foundation
import Combine

class FamilyTreeViewModel {
    @Published private(set) var members = Members()
    @Published private(set) var elder: ProfileModel?
    private var uniqueMembers = Set<Member>() {
        didSet { members = uniqueMembers.map { $0 } }
    }
    private let dataManager: DataManager
    private var familyID: String? {
        UserSession.shared.familyID
    }
    private var elderID: String? {
        UserSession.shared.elderID
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchData() {
        uniqueMembers.removeAll()
        fetchFamily()
        fetchElder()
    }
}

private extension FamilyTreeViewModel {
    func fetchFamily() {
        guard let id = familyID else { return }
        dataManager.readValue(from: id, resutlType: Family.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [fetchMember] family in
                    family.members.forEach { fetchMember($0) }
                }
            ))
    }
    
    func fetchMember(by id: String) {
        dataManager.readValue(from: id, resutlType: Member.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] member in
                    self?.uniqueMembers.insert(member)
                }
            ))
    }
    
    func fetchElder() {
        guard let id = elderID else { return }
        dataManager.readValue(from: id, resutlType: ProfileModel.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] elder in
                    self?.elder = elder
                }
            ))
    }
}

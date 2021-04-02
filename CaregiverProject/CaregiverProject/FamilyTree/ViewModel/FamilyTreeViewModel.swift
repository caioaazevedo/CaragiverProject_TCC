//
//  ViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 27/03/21.
//

import Foundation
import Combine

class FamilyTreeViewModel {
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
    }
    
    func queryMembers() {
        uniqueMembers.removeAll()
        queryFamily()
    }
}

private extension FamilyTreeViewModel {
    private func queryFamily() {
        guard let id = familyID else { return }
        dataManager.readValue(
            from: id,
            queryValue: .Family,
            resutlType: Family.self) { [queryMember] result in
            switch result {
            case .success(let family):
                family.members.forEach { queryMember($0) }
            case .failure(_): break
            }
        }
    }
    
    private func queryMember(by id: String) {
        dataManager.readValue(
            from: id,
            queryValue: .Member,
            resutlType: Member.self) { [weak self] result in
            switch result {
            case .success(let member):
                self?.uniqueMembers.insert(member)
            case .failure(_): break
            }
        }
    }
}

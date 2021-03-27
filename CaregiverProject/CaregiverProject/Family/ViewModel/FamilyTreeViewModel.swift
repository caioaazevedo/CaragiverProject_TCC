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
    private let interactor: FamilyInteractor
    private var familyID: String? {
        UserSession.shared.familyID
    }
    
    init(interactor: FamilyInteractor) {
        self.interactor = interactor
    }
    
    func queryMembers() {
        uniqueMembers.removeAll()
        queryFamily()
    }
}

private extension FamilyTreeViewModel {
    private func queryFamily() {
        guard let id = familyID else { return }
        interactor.readValue(id, .Family) { [queryMember] result in
            guard let family = result as? Family else { return }
            family.members.forEach { queryMember($0) }
        }
    }
    
    private func queryMember(by id: String) {
        interactor.readValue(id, .Member) { [weak self] result in
            guard let member = result as? Member else { return }
            self?.uniqueMembers.insert(member)
        }
    }
}

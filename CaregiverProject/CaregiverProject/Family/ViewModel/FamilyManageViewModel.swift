//
//  FamilyManageViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation

class FamilyManageViewModel {
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func createFamily(familyName: String, completion: @escaping () -> Void) {
        guard let id = UserSession.shared.id else { return }
        let familyId = UUID().uuidString
        let family = Family(
            id: familyId,
            name: familyName,
            members: [id]
        )
        dataManager.add(value: family, entityType: .Family) { _ in
            UserSession.shared.familyID = familyId
            completion()
        }
    }
    
    func joinFamily(familyID: String, completion: @escaping () -> Void) {
        dataManager.readValue(
            from: familyID,
            queryValue: .Family,
            resutlType: Family.self) { [dataManager] result in
            
            switch result {
            case .success(let family):
                dataManager.update(value: family, entityType: .Family) { _ in
                    UserSession.shared.familyID = familyID
                    completion()
                }
            case .failure(_): break
            }
        }
    }
}

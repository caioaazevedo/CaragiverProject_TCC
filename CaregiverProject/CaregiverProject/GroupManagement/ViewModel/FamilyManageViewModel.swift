//
//  FamilyManageViewModel.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation
import Combine

class FamilyManageViewModel {
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func createFamily(familyName: String, completion: @escaping () -> Void) {
        guard let id = UserSession.shared.id else { return }
        let elderID = UUID().uuidString
        UserSession.shared.elderID = elderID
        
        let familyId = UUID().uuidString
        let family = Family(
            id: familyId,
            name: familyName,
            members: [id]
        )
        dataManager.add(value: family) { _ in
            UserSession.shared.familyID = familyId
            completion()
        }
    }
    
    func joinFamily(familyID: String, completion: @escaping (Bool) -> Void) {
        guard
            let memberId = UserSession.shared.id,
            !familyID.isEmpty,
            ![".","#","$","[","]"].contains(familyID) else {
            completion(false)
            return
        }
        dataManager.readValue(from: familyID, resutlType: Family.self)
            .mapError { (error) -> Error in
                completion(false)
                return error
            }
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [dataManager] family in
                    var addedFamily = family
                    addedFamily.members.append(memberId)
                    dataManager.update(value: addedFamily) { _ in
                        UserSession.shared.familyID = familyID
                        completion(true)
                    }
                }
            ))
    }
}

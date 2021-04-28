//
//  ProfileInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit
import Combine
import Firebase

class ProfileViewModel {
    @Published private(set) var elder: ProfileModel?
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
}

extension ProfileViewModel {
    func fetchProfile() {
        guard let id = UserSession.shared.elderID else {
            fatalError("Não adicionou o idoso!")
        }
        dataManager.readValue(from: id, resutlType: ProfileModel.self)
            .subscribe(Subscribers.Sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] elder in
                    self?.elder = elder
                }
            ))
    }
    
    func update(profile: ProfileModel) {
        dataManager.update(value: profile) { _ in }
    }
}

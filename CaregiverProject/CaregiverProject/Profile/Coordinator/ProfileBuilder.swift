//
//  ProfileBuilder.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit
import Firebase

struct ProfileBuilder {
    func setUpProfileModule() -> ProfileViewController {
        let familyDataManager = FamilyDataManager(database: Database.database())
        let viewModel = ProfileViewModel(dataManager: familyDataManager)
        let view = ProfileView()
        let profileModule = ProfileViewController(
            profileView: view,
            viewModel: viewModel
        )
        let profileIcon = UITabBarItem(title: "Elder", image: .checkmark, tag: 2)
        profileModule.tabBarItem = profileIcon
        return profileModule
    }
}

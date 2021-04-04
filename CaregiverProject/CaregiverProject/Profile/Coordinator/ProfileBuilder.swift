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
        let viewModel = ProfileViewModel(database: Database.database())
        let profileModule = ProfileViewController(viewModel: viewModel)
        let profileIcon = UITabBarItem(title: "Elder", image: .checkmark, tag: 2)
        profileModule.tabBarItem = profileIcon
        profileModule.setupData()
        
        return profileModule
    }
}

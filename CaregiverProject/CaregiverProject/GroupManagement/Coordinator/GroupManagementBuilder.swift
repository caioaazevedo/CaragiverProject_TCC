//
//  GroupManagementBuilder.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 02/04/21.
//

import UIKit
import Firebase

struct GroupManagementBuilder {
    func buildFamilyManage(state: ManageState) -> FamilyManageViewController {
        let dataManager = FamilyDataManager(database: Database.database())
        let viewModel = FamilyManageViewModel(dataManager: dataManager)
        let familyViewController = FamilyManageViewController(manageState: state, viewModel: viewModel)
        return familyViewController
    }
}

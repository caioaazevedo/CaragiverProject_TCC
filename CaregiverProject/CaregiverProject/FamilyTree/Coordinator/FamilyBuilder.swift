//
//  Builder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Firebase
import Combine

final class FamilyBuilder{
    
    func buildFamilyTreeModule() -> FamilyTreeViewController{
        let dataManager = FamilyDataManager(database: Database.database())
        let viewModel = FamilyTreeViewModel(dataManager: dataManager)
        let view = FamilyTreeView()
        let dataSource = FamilyTreeDataSource()
        view.collectionView.dataSource = dataSource
        let familyTreeController = FamilyTreeViewController(
            viewModel: viewModel,
            familyTreeView: view,
            dataSource: dataSource
        )
        let familyIcon = UITabBarItem(title: "Family", image: #imageLiteral(resourceName: "Family"), tag: 0)
        familyTreeController.tabBarItem = familyIcon
        return familyTreeController
    }
}

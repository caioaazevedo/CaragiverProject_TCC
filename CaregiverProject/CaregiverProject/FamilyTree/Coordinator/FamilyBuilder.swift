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
        familyTreeController.bindViewModel()
        view.completion = {
            let url = URL(string: "login://" + "\(UserSession.shared.familyID!)")
            let fullText = ["\(UserSession.shared.username!) está te convidando para entrar no grupo. Token: \(url!)."]
            
            let activityViewController = UIActivityViewController(activityItems: fullText as [Any], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = familyTreeController.view
            activityViewController.excludedActivityTypes = [.print]
            familyTreeController.present(activityViewController, animated: true, completion: nil)
        }
        let familyIcon = UITabBarItem(title: "Family", image: .actions, tag: 0)
        familyTreeController.tabBarItem = familyIcon
        return familyTreeController
    }
}

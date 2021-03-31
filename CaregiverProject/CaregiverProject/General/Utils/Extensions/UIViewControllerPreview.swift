//
//  UIViewControllerPreview.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 27/03/21.
//

import SwiftUI
import Firebase

@available(iOS 13, *)
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> ViewController { viewController }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}


//MARK: - Preview
struct FamilyTreeControllerPreviews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            return FamilyTreeViewController(
                viewModel: FamilyTreeViewModel(dataManager: FamilyDataManager(database: Database.database())),
                familyTreeView: FamilyTreeView(),
                dataSource: FamilyTreeDataSource()
            )
        }
    }
}

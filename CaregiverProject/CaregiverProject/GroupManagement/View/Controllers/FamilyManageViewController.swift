//
//  FamilyManageViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit
import Firebase

protocol FamilyManageCoordinator: class {
    func showFamilyModule()
}

class FamilyManageViewController: UIViewController {
    var manageState: ManageState
    var viewModel: FamilyManageViewModel
    let familyManageView: FamilyManageView
    weak var coordinator: FamilyManageCoordinator?
    
    override func loadView() {
        super.loadView()
        view = familyManageView
        configureButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(manageState: ManageState, viewModel: FamilyManageViewModel) {
        self.manageState = manageState
        self.viewModel = viewModel
        self.familyManageView = FamilyManageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    private func configureButtons(){
        switch manageState{
        case .Join:
            familyManageView.primaryField.placeholder = "Family's Code"
            familyManageView.primaryButton.setTitle("Enter in family", for: .normal)
            familyManageView.primaryButton.addAction(
                UIAction { [joinFamily] _ in
                    joinFamily()
                },
                for: .touchUpInside
            )
        case .Create:
            familyManageView.primaryField.placeholder = "Family's Name"
            familyManageView.primaryButton.setTitle("Create Family", for: .normal)
            familyManageView.primaryButton.addAction(
                UIAction { [createFamily] _ in
                    createFamily()
                },
                for: .touchUpInside
            )
        }
    }
    
    private func joinFamily() {
        let familyID = familyManageView.primaryField.text ?? "Default"
        viewModel.joinFamily(familyID: familyID) { [goToFamilyModule] in
            goToFamilyModule()
        }
    }
    
    private func createFamily() {
        let familyName = familyManageView.primaryField.text ?? "Familia"
        viewModel.createFamily(familyName: familyName) { [goToFamilyModule] in
            goToFamilyModule()
        }
    }
    
    private func goToFamilyModule() {
        UserDefaults.loginState = .enteredFamily
        coordinator?.showFamilyModule()
    }

}

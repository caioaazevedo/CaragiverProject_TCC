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
        view = FamilyManageView()
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
        guard let view = view as? FamilyManageView else {return}
        switch manageState{
        case .Join:
            view.primaryField.placeholder = "Family's Code"
            
            view.primaryButton.setTitle("Enter in family", for: .normal)
            view.primaryButton.addAction(
                UIAction { [joinFamily] _ in
                    joinFamily()
                },
                for: .touchUpInside
            )
        case .Create:
            view.primaryField.placeholder = "Family's Name"
            view.primaryButton.setTitle("Create Family", for: .normal)
            view.primaryButton.addAction(
                UIAction { [createFamily] _ in
                    createFamily()
                },
                for: .touchUpInside
            )
        }
    }
    
    private func joinFamily() {
        guard let view = view as? FamilyManageView else {return}
        let familyID = view.primaryField.text ?? "Default"
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

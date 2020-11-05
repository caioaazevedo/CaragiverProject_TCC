//
//  FamilyManageViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit
import Firebase

class FamilyManageViewController: UIViewController{
    var manageState: ManageState
    var presenter: FamilyPresenterProtocol
    
    init(manageState: ManageState,familyManagePresenter: FamilyPresenterProtocol){
        self.manageState = manageState
        self.presenter = familyManagePresenter
        super.init(nibName: nil, bundle: nil)
//        self.view = presentedView as? UIView
    }
    
    override func loadView(){
        super.loadView()
        view = FamilyManageView()
        configureButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureButton(){
        guard let view = view as? FamilyManageView else {return}
        switch manageState{
        case .Join:
            view.primaryField.placeholder = "Family's Code"
            view.primaryButton.setTitle("Enter in family", for: .normal)
            view.primaryButton.addTarget(self, action: #selector(enterFamily), for: .touchUpInside)
        case .Create:
            view.primaryField.placeholder = "Family's Name"
            view.primaryButton.setTitle("Create Family", for: .normal)
            view.primaryButton.addTarget(self, action: #selector(createFamily), for: .touchUpInside)
        }
        
    }
    @objc func enterFamily() {
        guard let view = view as? FamilyManageView else {return}
        let family = Family(id: view.primaryField.text ?? "default", name: view.primaryField.text ?? "Familia", members: [])
        self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Family.self, operation: .read) { (result) in
            
            self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .update, completion: { _ in })
            var interactor = FamilyInteractor(database: Database.database())
            let module = Builder.buildFamilyListModule(with: &interactor)
            self.present(module, animated: true, completion: nil)
        }
    }
    @objc func createFamily() {
        guard let view = view as? FamilyManageView else {return}
        let family = Family(id: UUID().uuidString, name: view.primaryField.text ?? "Familia", members: [])
        self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .create) { (result) in
            self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .update, completion: { _ in
            var interactor = FamilyInteractor(database: Database.database())
            let module = Builder.buildFamilyListModule(with: &interactor)
            self.present(module, animated: true, completion: nil)
            })
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

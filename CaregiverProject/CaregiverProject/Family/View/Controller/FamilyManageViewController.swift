//
//  FamilyManageViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

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
        updateFamily()
    }
    
    func configureButton(){
        guard let view = view as? FamilyManageView else {return}
        switch manageState{
        case .Login:
            view.primaryField.placeholder = "Family's Code"
            view.primaryButton.setTitle("Enter in family", for: .normal)
            view.primaryButton.addTarget(self, action: #selector(enterFamily), for: .touchUpInside)
        case .Register:
            view.primaryField.placeholder = "Family's Name"
            view.primaryButton.setTitle("Create Family", for: .normal)
            view.primaryButton.addTarget(self, action: #selector(createFamily), for: .touchUpInside)
        }
        
    }
    
    
    @objc func enterFamily() {
        guard let view = view as? FamilyManageView else {return}
        let family = Family(id: "EAD9F58C-20F8-4CEA-A046-9439F8EE4C5A", name: view.primaryField.text ?? "Familia", members: [])
        self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .read) { (result) in
            print(result)
        }
    }
    
    @objc func createFamily() {
        guard let view = view as? FamilyManageView else {return}
        let family = Family(id: UUID().uuidString, name: view.primaryField.text ?? "Familia", members: [])
        self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .create) { (result) in
            print(result)
        }
    }
    
    func updateFamily(){
        let family = Family(id: "EAD9F58C-20F8-4CEA-A046-9439F8EE4C5A", name: "Nova Familia", members: ["Guilherme"])
        self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .update) { (result) in
            print(result)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

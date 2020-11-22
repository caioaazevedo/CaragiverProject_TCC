//
//  FamilyManageViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit
import Firebase

class FamilyManageViewController: UIViewController, FamilyControllerLogic{
    var manageState: ManageState
    var presenter: FamilyPresenterProtocol
    
    override func loadView(){
        super.loadView()
        view = FamilyManageView()
        configureButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(manageState: ManageState,familyManagePresenter: FamilyPresenterProtocol){
        self.manageState = manageState
        self.presenter = familyManagePresenter
        super.init(nibName: nil, bundle: nil)
//        self.view = presentedView as? UIView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    func configureButtons(){
        guard let view = view as? FamilyManageView else {return}
        switch manageState{
        case .Join:
            view.primaryField.placeholder = "Family's Code"
            view.primaryButton.setTitle("Enter in family", for: .normal)
            view.primaryButton.addTarget(self, action: #selector(joinFamily), for: .touchUpInside)
        case .Create:
            view.primaryField.placeholder = "Family's Name"
            view.primaryButton.setTitle("Create Family", for: .normal)
            view.primaryButton.addTarget(self, action: #selector(createFamily), for: .touchUpInside)
        }
        
    }
    
    func setupData(completion: @escaping () -> ()){
        self.presenter.assignEntity(entityID: UserSession.shared.familyID!) {
            completion()
        }
    }
    
    @objc func joinFamily() {
//        guard let view = view as? FamilyManageView else {return}
//        guard let presenter = presenter as? FamilyPresenter else {return}
//        var family = Family(id: view.primaryField.text ?? "default", name: view.primaryField.text ?? "Familia", members: [UserSession.shared.username!])
//        presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: [String].self, operation: .read) { members in
//            family.members = members ?? []
//            family.members.append(UserSession.shared.username!)
//            presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .update, completion: { _ in
//                presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: [String].self, operation: .read, completion: { familyMembers in
//
//                    let module = FamilyBuilder.buildFamilyListModule(with: &presenter.interactor)
//                module.members = familyMembers ?? []
//                self.present(module, animated: true, completion: nil)
//            })
//            })
//
//        }
        
        
        guard let view = view as? FamilyManageView else {return}
        guard let presenter = presenter as? FamilyPresenter else {return}
        UserSession.shared.familyID = view.primaryField.text
        var family = Family(id: view.primaryField.text ?? "default", name: view.primaryField.text ?? "Familia", members: [UserSession.shared.id!])
        self.setupData {
            self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Family.self, operation: .read) { (result) in
                family.members = result?.members ?? []
                family.members.append(UserSession.shared.id!)
                presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .update, completion: { _ in
                    self.setupData {
                        let module = FamilyBuilder.buildFamilyTabBarController()
                        self.present(module, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    
    @objc func createFamily() {
        guard let view = view as? FamilyManageView else {return}
        guard let presenter = presenter as? FamilyPresenter else {return}
        UserSession.shared.familyID = UUID().uuidString
        let family = Family(id: UserSession.shared.familyID!, name: view.primaryField.text ?? "Familia", members: [UserSession.shared.id!])
        
        presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .create) { (result) in
            presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .update, completion: { _ in
                self.setupData {
                    let module = FamilyBuilder.buildFamilyTabBarController()
                    self.present(module, animated: true, completion: nil)
                }
            })
        }
    }
 
    
    
}

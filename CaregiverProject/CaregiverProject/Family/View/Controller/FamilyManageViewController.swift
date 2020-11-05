//
//  FamilyManageViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

class FamilyManageViewController: UIViewController{
    var presenter: FamilyPresenterProtocol
    
    init(familyManagePresenter: FamilyPresenterProtocol){
        self.presenter = familyManagePresenter
        super.init(nibName: nil, bundle: nil)
//        self.view = presentedView as? UIView
    }
    
    override func loadView(){
        super.loadView()
        view = FamilyManageView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    func configureButton(){
        guard let view = view as? FamilyManageView else {return}
        view.createFamilyBtn.addTarget(self, action: #selector(createFamily), for: .touchUpInside)
    }
    
    @objc func createFamily() {
        guard let view = view as? FamilyManageView else {return}
        let family = Family(id: UUID().uuidString, name: view.familyNameFld.text ?? "Familia", members: [])
        self.presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Bool.self, operation: .create) { (result) in
            print(result)
        }
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

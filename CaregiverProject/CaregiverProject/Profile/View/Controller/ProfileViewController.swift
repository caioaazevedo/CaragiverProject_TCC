//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

class ProfileViewController: UIViewController{
    var presenter: ProfilePresenterLogic
    
    override func loadView() {
        super.loadView()
        view = ProfileView()
      //  self.setupData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(presenter: ProfilePresenterLogic){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(){
        self.presenter.assignEntity(entityID: UserSession.shared.elderID ?? UUID().uuidString) {
            self.configureButtons()
        }
    }
    
    func configureButtons(){
        guard let view = view as? ProfileView else {return}
        view.profileImage.image = UIImage(data: presenter.entity!.photo)
        view.nameLabel.text = presenter.entity?.name
        view.ageLabel.text = "\(String(describing: presenter.entity?.age))"
        view.notesField.text = presenter.entity?.notes
    }
    
    func insertValues(){
        guard let view = view as? ProfileView else {return}
        let entity = ProfileEntity(id: view.nameLabel.text!, name: view.nameLabel.text!, age: Int(view.ageLabel.text!)!, photo: (view.profileImage.image?.pngData())!, notes: view.notesField.text!, kinship: .brother)
        self.presenter.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .create) { result in
            guard let result = result else {return}
            if result { self.setupData() }
        }
    }
    
    func updateValues(){
        guard let view = view as? ProfileView else {return}
        let entity = ProfileEntity(id: view.nameLabel.text!, name: view.nameLabel.text!, age: Int(view.ageLabel.text!)!, photo: (view.profileImage.image?.pngData())!, notes: view.notesField.text!, kinship: .brother)
        self.presenter.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .update) { result in
            guard let result = result else {return}
            if result { self.setupData() }
        }
    }
}

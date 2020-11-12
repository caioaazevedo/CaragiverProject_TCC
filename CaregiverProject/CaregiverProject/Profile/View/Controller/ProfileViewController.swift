//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

class ProfileViewController: UIViewController{
    var presenter: ProfilePresenterLogic
    var profileView: ProfileView?
    var buttonState = true
    override func loadView() {
        super.loadView()
        UserSession.shared.elderID = "BB741AB9-F187-4EAC-AE6A-31D193712F89"
        profileView = ProfileView()
        profileView?.notesField.delegate = self
        view = profileView
        
        self.setupData()
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
            self.configureViews()
        }
    }
    
    func configureViews(){
        guard let view = view as? ProfileView else {return}
        view.profileImage.image = presenter.entity?.photo
        view.nameLabel.text = "Nome do idoso: \(presenter.entity?.name ?? "")"
        view.ageLabel.text = "Idade do idoso: \(presenter.entity?.age ?? 0)"
        view.notesField.text = presenter.entity?.notes
        view.mainButton.addTarget(self, action: #selector(mainButtonClick), for: .touchUpInside)
    }
    
    @objc func mainButtonClick(){
        guard let view = view as? ProfileView else {return}
        if !buttonState{
            self.insertValues()
            view.mainButton.setTitle("Edit", for: .normal)
        } else {
            self.makeViewEditable()
            view.mainButton.setTitle("Confirm", for: .normal)
        }
        buttonState.toggle()
    }
    
    
    func insertValues(){
        guard let view = view as? ProfileView else {return}
        let entity = ProfileEntity(id: UserSession.shared.elderID!, name: view.nameLabel.text ?? "Undefined", age: 8, photo: (view.profileImage.image ?? UIImage(named: "profileIcon"))!, notes: view.notesField.text ?? "Undefined", memberType: .son_daughter)
        self.presenter.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .create) { result in
            guard let result = result else {return}
            if result { self.setupData() }
        }
    }
    
    func updateValues(){
        guard let view = view as? ProfileView else {return}
        let entity = ProfileEntity(id: view.nameLabel.text!, name: view.nameLabel.text!, age: Int(view.ageLabel.text!)!, photo: view.profileImage.image!, notes: view.notesField.text!, memberType: .son_daughter)
        self.presenter.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .update) { result in
            guard let result = result else {return}
            if result { self.setupData() }
        }
    }
    
    func makeViewEditable(){
        guard let view = view as? ProfileView else {return}
        view.nameLabel.isUserInteractionEnabled = true
    }
}

extension ProfileViewController: UITextViewDelegate{
    
}

//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

class ProfileViewController: UIViewController{
    var presenter: ProfilePresenterLogic
    var imageManager: ImagePickerManager?
    var profileView: ProfileView = .init()
    var buttonState = true
    
    
    override func loadView() {
        super.loadView()
        UserSession.shared.elderID = "BB741AB9-F187-4EAC-AE6A-31D193712F89"
        profileView = ProfileView()
        profileView.notesField.delegate = self
        profileView.imageButton.addTarget(self, action: #selector(presentPicker), for: .touchUpInside)
        profileView.mainButton.addTarget(self, action: #selector(mainButtonClick), for: .touchUpInside)
        profileView.mainTextField.isHidden = true
        profileView.secTextField.isHidden = true
        view = profileView
        self.setupData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager = ImagePickerManager(viewController: self, delegate: self)
      
        
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
        view.nameLabel.text = "\(presenter.entity?.name ?? "")"
        view.ageLabel.text = "\(presenter.entity?.age ?? 0)"
        view.notesField.text = presenter.entity?.notes
        
    }
    
    @objc func mainButtonClick(){
        guard let view = view as? ProfileView else {return}
        if !buttonState{
            view.nameLabel.text = view.mainTextField.text
            view.ageLabel.text = view.secTextField.text
            setdownViewEditing()
            self.insertValues()
            view.mainButton.setTitle("Edit", for: .normal)
        } else {
            self.setupViewEditing()
            view.mainButton.setTitle("Confirm", for: .normal)
        }
        buttonState.toggle()
    }
    
    @objc func presentPicker() {
        imageManager?.present()
    }
    
    
    
    func insertValues(){
        guard let view = view as? ProfileView else {return}
        guard let age = Int(view.ageLabel.text ?? "0") else {return}
        let entity = ProfileEntity(id: UserSession.shared.elderID!, name: view.nameLabel.text ?? "Undefined", age: age, photo: (view.profileImage.image ?? UIImage(named: "profileIcon"))!, notes: view.notesField.text ?? "Undefined", memberType: .son_daughter)
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
    
    func setupViewEditing(){
        profileView.nameLabel.isHidden = true
        profileView.ageLabel.isHidden = true
        profileView.mainTextField.isHidden = false
        profileView.secTextField.isHidden = false
    }
    
    func setdownViewEditing(){
        profileView.nameLabel.isHidden = false
        profileView.ageLabel.isHidden = false
        profileView.mainTextField.isHidden = true
        profileView.secTextField.isHidden = true
    }
}

extension ProfileViewController: UITextViewDelegate{}

extension ProfileViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let view = view as? ProfileView else {return}
        view.profileImage.image = image
    }
}


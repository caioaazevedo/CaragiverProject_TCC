//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit
import Combine

class ProfileViewController: UIViewController, UITextFieldDelegate{
    var presenter: ProfilePresenterLogic
    var imageManager: ImagePickerManager?
    var profileView: ProfileView = .init()
    var buttonState = true
    
    lazy var publisher: AnyPublisher<ProfileEntity, Never> = {
        return self.subject!.eraseToAnyPublisher()
    }()
    
    private(set) var subject: PassthroughSubject<ProfileEntity, Never>? = PassthroughSubject<ProfileEntity, Never>()
        
    private(set) var updated: Bool = false {
        didSet{
            guard let view = view as? ProfileView else {return}
            let elder = ProfileEntity(id: "", name: view.nameLabel.text ?? "Idoso", age: Int(view.ageLabel.text ?? "70") ?? 70,photo: view.profileImage.image)
            self.subject?.send(elder)
        }
    }
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager = ImagePickerManager(viewController: self, delegate: self)
        
        profileView.mainTextField.delegate = self
        profileView.notesField.delegate = self
        profileView.secTextField.delegate = self
    }
    
    init(presenter: ProfilePresenterLogic){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(){
        self.presenter.assignEntity(entityID: UserSession.shared.elderID ?? UUID().uuidString) {
            self.configureViews()
            self.updated.toggle()
        }
    }
    
    
    func configureViews(){
        guard let view = view as? ProfileView else {return}
        view.profileImage.image = presenter.entity?.photo ?? UIImage(named: "profileIcon")
        view.nameLabel.text = "\(presenter.entity?.name ?? "")"
        view.ageLabel.text = "\(presenter.entity?.age ?? 0)"
        
    }
    
    @objc func mainButtonClick(){
        guard let view = view as? ProfileView else {return}
        if !buttonState{
            view.nameLabel.text = view.mainTextField.text
            view.ageLabel.text = view.secTextField.text
            updated.toggle()
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
        if !buttonState{
        imageManager?.present()
        }
    }
    
    
    
    func insertValues(){
        guard let view = view as? ProfileView else {return}
        guard let age = Int(view.ageLabel.text ?? "0") else {return}
        let entity = ProfileEntity(id: UserSession.shared.elderID!, name: view.nameLabel.text ?? "Nome do Idoso", age: age, photo: (view.profileImage.image ?? UIImage(named: "profileIcon"))!)
        self.presenter.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .create) { result in
            guard let result = result else {return}
            if result { self.setupData() }
        }
    }
    
    func updateValues(){
        guard let view = view as? ProfileView else {return}
        let entity = ProfileEntity(id: view.nameLabel.text!, name: view.nameLabel.text!, age: Int(view.ageLabel.text!)!, photo: view.profileImage.image!)
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
        
        profileView.mainTextField.text = profileView.nameLabel.text
        profileView.secTextField.text = profileView.ageLabel.text
    }
    
    func setdownViewEditing(){
        profileView.nameLabel.isHidden = false
        profileView.ageLabel.isHidden = false
        profileView.mainTextField.isHidden = true
        profileView.secTextField.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProfileViewController: UITextViewDelegate{}

extension ProfileViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let view = view as? ProfileView else {return}
        view.profileImage.image = image
        self.updated.toggle()
    }
}


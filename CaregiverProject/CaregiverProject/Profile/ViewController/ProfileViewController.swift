//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit
import Combine

class ProfileViewController: UIViewController, UITextFieldDelegate{
    var viewModel: ProfileViewModel
    var imageManager: ImagePickerManager?
    var profileView: ProfileView = .init()
    var buttonState = true
    
    lazy var publisher: AnyPublisher<ProfileModel, Never> = {
        return self.subject!.eraseToAnyPublisher()
    }()
    
    private(set) var subject: PassthroughSubject<ProfileModel, Never>? = PassthroughSubject<ProfileModel, Never>()
        
    private(set) var updated: Bool = false {
        didSet{
            guard let view = view as? ProfileView else {return}
            let elder = ProfileModel(id: "", name: view.nameLabel.text ?? "Idoso", age: Int(view.ageLabel.text ?? "70") ?? 70,photo: view.profileImage.image)
            self.subject?.send(elder)
        }
    }
    
    override func loadView() {
        super.loadView()
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
    
    init(viewModel: ProfileViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(){
        self.viewModel.assignEntity(entityID: UserSession.shared.elderID ?? UUID().uuidString) {
            self.configureViews()
            self.updated.toggle()
        }
    }
    
    
    func configureViews(){
        guard let view = view as? ProfileView else {return}
        view.profileImage.image = viewModel.entity?.photo ?? UIImage(named: "profileIcon")
        view.nameLabel.text = "\(viewModel.entity?.name ?? "")"
        view.ageLabel.text = "\(viewModel.entity?.age ?? 0)"
        
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
        let entity = ProfileModel(id: UserSession.shared.elderID ?? UUID().uuidString, name: view.nameLabel.text ?? "Nome do Idoso", age: age, photo: (view.profileImage.image ?? UIImage(named: "profileIcon"))!)
        self.viewModel.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .create) { result in
            guard let result = result else {return}
            if result { self.setupData() }
        }
    }
    
    func updateValues(){
        guard let view = view as? ProfileView else {return}
        let entity = ProfileModel(id: view.nameLabel.text!, name: view.nameLabel.text!, age: Int(view.ageLabel.text!)!, photo: view.profileImage.image!)
        self.viewModel.manageEntity(entity: entity, intendedReturn: Bool.self, operation: .update) { result in
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

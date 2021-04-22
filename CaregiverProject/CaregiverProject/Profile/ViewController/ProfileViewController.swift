//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit
import Combine

class ProfileViewController: UIViewController {
    private let profileView: ProfileView
    private let viewModel: ProfileViewModel
    private var subscribers = Set<AnyCancellable>()
    weak var coordinator: ProfileCoodinator?

    private lazy var imagePicker: ImagePickerManager = { [weak self] in
        guard let self = self else { fatalError() }
        return ImagePickerManager(
            viewController: self,
            delegate: self
        )
    }()
    
    init(profileView: ProfileView, viewModel: ProfileViewModel) {
        self.profileView = profileView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
        setUpButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = profileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchProfile()
    }
    
    private func setUpButtons() {
        profileView.taskButton.addAction(
            UIAction { [weak self] _ in
                self?.coordinator?.presentTaskView()
            },
            for: .touchUpInside
        )
        profileView.imageButton.addAction(
            UIAction { [imagePicker] _ in
                imagePicker.present()
            },
            for: .touchUpInside
        )
        let storeDataAction = UIAction { [storeData] _ in
            storeData()
        }
        profileView.nameTextField.addAction(storeDataAction, for: .editingDidEnd)
        profileView.ageTextField.addAction(storeDataAction, for: .editingDidEnd)
        profileView.bloodTypeTextField.addAction(storeDataAction, for: .editingDidEnd)
    }
    
    private func bindViewModel() {
        viewModel.$elder
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: updateView)
            .store(in: &subscribers)
    }
    
    private func updateView(_ elder: ProfileModel?) {
        profileView.nameTextField.text = elder?.name ?? ""
        profileView.ageTextField.text = elder == nil ? "" : "\(elder?.age ?? 0)"
    }
    
    private func storeData() {
        guard let elderID = UserSession.shared.elderID else {
            fatalError("Elder not registered!")
        }
        let age = Int(profileView.ageTextField.text ?? "")
        let elder = ProfileModel(
            id: elderID,
            name: profileView.nameTextField.text ?? "",
            age: age ?? 0,
            photo: profileView.profileImage.image
        )
        viewModel.update(profile: elder)
    }
}

extension ProfileViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        profileView.profileImage.image = image
        storeData()
    }
}

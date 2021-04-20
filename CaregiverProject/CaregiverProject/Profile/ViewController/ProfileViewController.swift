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
    }
    
    private func bindViewModel() {
        viewModel.$elder
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: updateProfile)
            .store(in: &subscribers)
    }
    
    private func updateProfile(_ elder: ProfileModel?) {
        //TO-DO: after the profile view is done
    }
}

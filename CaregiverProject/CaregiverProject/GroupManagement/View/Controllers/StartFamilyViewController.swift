//
//  StartFamilyViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit

protocol StartFamilyCoordinator: AnyObject {
    func pushToFamilyManage(state: ManageState)
}

class StartFamilyViewController: UIViewController {
    
    var startFamilyView = StartFamilyView()
    
    weak var coordinator: StartFamilyCoordinator?
    
    override func loadView() {
        view = startFamilyView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let _ = UserSession.shared.familyID else { return }
        coordinator?.pushToFamilyManage(state: .Join)
    }
    
    private func configureButtons(){
        startFamilyView.createFamilyButton.addAction(
            UIAction { [weak self] _ in
                self?.coordinator?.pushToFamilyManage(state: .Create)
            },
            for: .touchUpInside
        )
        startFamilyView.joinFamilyButton.addAction(
            UIAction { [weak self] _ in
                self?.coordinator?.pushToFamilyManage(state: .Join)
            },
            for: .touchUpInside
        )
    }
}

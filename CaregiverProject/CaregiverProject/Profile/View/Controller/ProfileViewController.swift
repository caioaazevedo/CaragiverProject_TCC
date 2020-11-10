//
//  ProfileViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

class ProfileViewController: UIViewController{
    var presenter: ProfilePresenterLogic
    
    init(presenter: ProfilePresenterLogic){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

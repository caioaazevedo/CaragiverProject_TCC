//
//  StartFamilyViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit

class StartFamilyViewController: UIViewController {
    
    var startFamilyView = StartFamilyView()
    
    override func loadView() {
        view = startFamilyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

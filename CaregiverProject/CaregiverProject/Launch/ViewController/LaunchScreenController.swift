//
//  LaunchScreenController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 03/05/21.
//

import UIKit
import Combine

class LaunchScreenController: UIViewController{
        
    var launchView = LaunchScreenView()
    
    override func loadView() {
        super.loadView()
        view = launchView
    }

}

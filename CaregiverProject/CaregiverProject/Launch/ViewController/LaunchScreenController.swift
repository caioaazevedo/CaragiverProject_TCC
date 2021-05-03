//
//  LaunchScreenController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 03/05/21.
//

import UIKit
import Combine

class LaunchScreenController: UIViewController{
        
    var launchView: LaunchScreenView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        launchView = LaunchScreenView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = launchView
    }

}

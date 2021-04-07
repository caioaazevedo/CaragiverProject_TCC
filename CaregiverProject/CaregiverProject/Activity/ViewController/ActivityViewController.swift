//
//  ActivityViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit

class ActivityViewController: UIViewController{
    var activityView: ActivityView = .init(frame: UIScreen.main.bounds)
    
    override func loadView() {
        super.loadView()
        view = activityView
        activityView.callReload()
    }
    
}

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityView.viewModel.fetchFromFirebase(completion: { tasks in
            self.activityView.viewModel.tasks = tasks
            self.activityView.tableView.reloadData()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        activityView.viewModel.uploadToFirebase()
    }
    
}

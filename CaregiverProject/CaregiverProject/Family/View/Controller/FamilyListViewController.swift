//
//  FamilyListViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyListViewController: UIViewController{
    
    var presentedView: ViewCodeProtocol?
    var presenter: FamilyPresenterProtocol?
    var members: [String] = []
    
    init(presentedView: FamilyListView,familyPresenter: FamilyPresenterProtocol){
        self.presenter = familyPresenter
        super.init(nibName: nil, bundle: nil)
        setupView(presentedView)
        
    }
    
    override func loadView() {
        super.loadView()
        // periodic
        self.view = UIView()
    }
    
    override func viewDidLoad() {
        print(self.members)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(_ presentedView: FamilyListView){
        presentedView.tableView.register(FamilyTableViewCell.self,forCellReuseIdentifier: "cell")
        presentedView.tableView.delegate = self
        presentedView.tableView.dataSource = self
        self.view = presentedView
    }
}

//
//  FamilyListViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyListViewController: UIViewController{
    var presenter: FamilyPresenterProtocol?
    var presentedView: ViewCodeProtocol?
    
    init(presentedView: ViewCodeProtocol,familyPresenter: FamilyPresenter){
        self.presenter = familyPresenter
        super.init(nibName: nil, bundle: nil)
        self.view = presentedView as? UIView
        
    }
    
    override func loadView() {
        super.loadView()
        // periodic
        self.view = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

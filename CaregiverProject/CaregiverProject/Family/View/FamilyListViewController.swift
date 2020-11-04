//
//  FamilyListViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyListViewController: UIViewController{
    var presenter: FamilyPresenterProtocol
    var familyListView: ViewCodeProtocol
    
    init(view: ViewCodeProtocol,familyPresenter: FamilyPresenter){
        self.presenter = familyPresenter
        self.familyListView = view
        super.init(nibName: nil, bundle: nil)        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

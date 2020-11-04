//
//  FamilyManageViewController.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

class FamilyManageViewController: UIViewController{
    var presenter: FamilyPresenterProtocol
    var familyManageView: ViewCodeProtocol
    
    init(view: ViewCodeProtocol,familyManagePresenter: FamilyPresenterProtocol){
        self.presenter = familyManagePresenter
        self.familyManageView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

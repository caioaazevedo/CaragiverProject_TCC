//
//  FamilyTreeViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeViewController: UIViewController {
    var presenter: FamilyPresenter?
    var presentedView: ViewCodeProtocol?{
        willSet{
            if let view = newValue as? UIView{
                self.view = view
            }
        }
    }
}

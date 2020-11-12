//
//  FamilyTreeViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeViewController: UIViewController {
    var presenter: FamilyPresenter?
    
    var sections = [
        (header: "Filhos", members: ["Braga"]),
        (header: "Netos", members: ["Caio","Fabio","Gui"])
    ]

    var presentedView: ViewCodeProtocol?{
        willSet{
            if let view = newValue as? UIView{
                self.view = view
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppUtility.lockOrientation(.all)
    }
}

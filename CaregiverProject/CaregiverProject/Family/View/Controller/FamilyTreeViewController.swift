//
//  FamilyTreeViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeViewController: UIViewController {
    var presenter: FamilyPresenter?
    
    lazy var sectionDict: [Int:(header: String, members: [Member])] = {
        var dict = [Int:(header: String, members: [Member])]()
        dict[MemberType.husband_wife.type] = (header: "Husband/Wife", members: [Member]())
        dict[MemberType.son_daughter.type] = (header: "Son/Daugther", members: [Member]())
        dict[MemberType.grandson_granddaughter.type] = (header: "Grandson/Granddaughter", members: [Member]())
        dict[MemberType.others.type] = (header: "Others", members: [Member]())
        return dict
    }()

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

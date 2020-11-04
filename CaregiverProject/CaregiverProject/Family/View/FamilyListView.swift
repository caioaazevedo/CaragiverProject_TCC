//
//  FamilyListView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyListView: UIView{
    
    lazy var tableView: FamilyTableView = {
         let view = FamilyTableView(frame: .zero, style: .plain)
         view.register(FamilyTableViewCell.self, forCellReuseIdentifier: "Cell")
         return view
     }()
}

extension FamilyListView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        self.addSubview(tableView)
    }
    
    func setUpViewConstraints() {}
    func setUpAditionalConficuration() {}
}

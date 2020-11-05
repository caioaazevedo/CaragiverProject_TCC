//
//  FamilyTableView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

class FamilyTableView: UITableView{
    lazy var memberCell: FamilyTableViewCell = {
        let view = FamilyTableViewCell()        
        return view
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame,style: style)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FamilyTableView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        self.addSubview(memberCell)
    }
    
    func setUpViewConstraints() {}
    func setUpAditionalConficuration() {}
    
    
}

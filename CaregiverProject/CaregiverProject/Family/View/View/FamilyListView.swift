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
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FamilyListView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        self.addSubview(tableView)
    }
    
    func setUpViewConstraints() {
        // Periodico, mudar assim que pegar a SuperView
        tableView.frame.size.width = Metrics.Device.width
        tableView.frame.size.height = Metrics.Device.height
//
//        tableView.topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
//        tableView.leftAnchor.constraint(equalTo: superview!.leftAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: superview!.rightAnchor).isActive = true
    }
    func setUpAditionalConficuration() {}
}

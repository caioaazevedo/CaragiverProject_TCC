//
//  FamilyTableViewCell.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyTableViewCell: UITableViewCell{
    
    private static let preferredHeight = Metrics.TableRow.default
    
    lazy var memberLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension FamilyTableViewCell: ViewCodeProtocol{
    func setUpViewHierarchy() {
        self.addSubview(memberLabel)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([])
    }
    
    func setUpAditionalConficuration() {}
    
    
}

//
//  FamilyTreeCollectionReusableView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 12/11/20.
//

import UIKit

class FamilyTreeCollectionReusableView: UICollectionReusableView {
    
    lazy var headerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = #colorLiteral(red: 0.5019147992, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FamilyTreeCollectionReusableView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(headerLabel)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
}

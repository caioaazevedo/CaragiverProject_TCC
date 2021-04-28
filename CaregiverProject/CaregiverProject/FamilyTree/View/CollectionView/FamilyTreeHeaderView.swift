//
//  FamilyTreeCollectionReusableView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 12/11/20.
//

import UIKit

class FamilyTreeHeaderView: UICollectionReusableView {
    
    static let identifier = "FamilyTreeHeaderView"
    
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
        layoutMargins.right = 20
        layoutMargins.left = 20
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FamilyTreeHeaderView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(headerLabel)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .clear
    }
    
    
}

//
//  CategoryModalCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

class CategoryModalTableViewCell: UITableViewCell {

    static let identifier = "CategoryModalCellID"
    
    lazy var color: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var categoryName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Name"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUp() {
        setUpView()
    }
    
    func setCornerRadius() {
        layoutIfNeeded()
        color.layer.cornerRadius = color.frame.width/2
    }
}

extension CategoryModalTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(color)
        contentView.addSubview(categoryName)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            color.centerYAnchor.constraint(equalTo: centerYAnchor),
            color.trailingAnchor.constraint(equalTo: trailingAnchor),
            color.heightAnchor.constraint(equalToConstant: 20),
            color.widthAnchor.constraint(equalToConstant: 20),
            
            categoryName.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            categoryName.trailingAnchor.constraint(equalTo: color.leadingAnchor, constant: -10)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        selectionStyle = .none
    }
}

//
//  CategoryTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    static let identifier = "CategoryCellID"
    
    private let icon: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "bookmark.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Category"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var categoryName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Name"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var categoryColor: UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func setUp() {
        setUpView()
    }
}

extension CategoryTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(icon)
        addSubview(categoryColor)
        addSubview(titleLabel)
        addSubview(categoryName)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            categoryColor.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
            
            categoryColor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            categoryColor.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryColor.heightAnchor.constraint(equalToConstant: 30),
            categoryColor.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            categoryName.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryName.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
}

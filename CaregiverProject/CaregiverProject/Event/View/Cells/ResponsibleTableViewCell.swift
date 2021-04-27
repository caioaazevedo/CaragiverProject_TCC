//
//  ResponsibleTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

class ResponsibleTableViewCell: UITableViewCell {

    static let identifier = "ResponsibleCellID"
    
    private let icon: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Responsible"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ResponsibleName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "None"
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
}

extension ResponsibleTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ResponsibleName)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 5),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),

            ResponsibleName.centerYAnchor.constraint(equalTo: centerYAnchor),
            ResponsibleName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
}


//
//  LocalTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

class LocalTableViewCell: UITableViewCell {

    static let identifier = "LocalCellID"
    
    private let icon: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "mappin.and.ellipse", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleText: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Local"
        text.textAlignment = .left
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    func setUp() {
        setUpView()
    }
}

extension LocalTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(titleText)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),

            titleText.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleText.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
            titleText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleText.widthAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
}


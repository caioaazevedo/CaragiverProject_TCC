//
//  LocalTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

protocol LocalTableViewCellDelegate: class {
    func didChangeLocal(text: String)
}

class LocalTableViewCell: UITableViewCell {
    
    private weak var delegate: LocalTableViewCellDelegate?

    static let identifier = "LocalCellID"
    
    private let icon: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "mappin.and.ellipse", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var localText: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Local"
        text.textAlignment = .left
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    func setUp(delegate: LocalTableViewCellDelegate) {
        self.delegate = delegate
        setUpView()
    }
}

//MARK:- Actions
extension LocalTableViewCell {
    @objc func textDidChange(_ textField: UITextField) {
        if let text = textField.text {
            delegate?.didChangeLocal(text: text)
        }
    }
}

extension LocalTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(localText)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),

            localText.centerYAnchor.constraint(equalTo: centerYAnchor),
            localText.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
            localText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            localText.widthAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        localText.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
}


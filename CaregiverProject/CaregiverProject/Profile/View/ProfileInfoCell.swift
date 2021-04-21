//
//  ProfileInfoCell.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 21/04/21.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    
    static let identifier = "ProfileInfoCell"
    weak var delegate: ProfileUpdating?
    
    var info = String() {
        willSet { infoLabel.text = "\(newValue):" }
    }
        
    private lazy var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var infoTextField: UITextField = {
        let textField = UITextField()
        textField.addAction(
            UIAction { [updateDataStorage] _ in
                updateDataStorage()
            },
            for: .editingDidEnd
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 16
        stack.addArrangedSubview(infoLabel)
        stack.addArrangedSubview(infoTextField)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private func updateDataStorage() {
        if let info = infoLabel.text,
           let data = infoTextField.text {
            delegate?.updateProfile(info: info, data: data)
        }
    }
}

extension ProfileInfoCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(infoStackView)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            infoTextField.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor),
            infoTextField.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        contentView.layoutMargins.left = 20
        contentView.layoutMargins.right = 20
        contentView.layoutMargins.top = 16
        contentView.layoutMargins.bottom = 16
        backgroundColor = .clear
    }
}

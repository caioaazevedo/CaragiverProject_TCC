//
//  FamilyManageView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyManageView: UIView{
    
    var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var primaryField: UITextField = {
        var text = UITextField(frame: .zero)
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var primaryButton: UIButton = {
        var button = UIButton(frame: .zero)        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FamilyManageView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(primaryField)
        addSubview(primaryButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            primaryField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            primaryField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            primaryField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            primaryField.heightAnchor.constraint(equalToConstant: 40),

            primaryButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            primaryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            primaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            primaryButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
    
}

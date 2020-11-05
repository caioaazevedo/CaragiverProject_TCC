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
        label.text = "Criar Família"
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var familyNameFld: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Family's name"
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var createFamilyBtn: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Criar Família", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 3
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
        addSubview(familyNameFld)
        addSubview(createFamilyBtn)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            familyNameFld.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            familyNameFld.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            familyNameFld.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            familyNameFld.heightAnchor.constraint(equalToConstant: 40),

            createFamilyBtn.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            createFamilyBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            createFamilyBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            createFamilyBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
    
    
}

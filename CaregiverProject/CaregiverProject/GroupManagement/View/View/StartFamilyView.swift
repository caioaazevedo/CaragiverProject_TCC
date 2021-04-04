//
//  StartFamilyView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit

class StartFamilyView: UIView {
    
    var createFamilyButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Create a Family", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var joinFamilyButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Join a Family", for: .normal)
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

extension StartFamilyView: ViewCodeProtocol {
    
    func setUpViewHierarchy() {
        addSubview(createFamilyButton)
        addSubview(joinFamilyButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            createFamilyButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            createFamilyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            createFamilyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            createFamilyButton.heightAnchor.constraint(equalToConstant: 40),

            joinFamilyButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            joinFamilyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            joinFamilyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            joinFamilyButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}



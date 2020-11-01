//
//  LoginView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 01/11/20.
//

import UIKit

class LoginView: UIView {
    
    var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Welcome to Caregiver App"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subTitleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Please, Sign In"
        let font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var username: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Username"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var password: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Password"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var signInButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Sing In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
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

extension LoginView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(username)
        addSubview(password)
        addSubview(signInButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subTitleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            username.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10),
            password.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            signInButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setUpAditionalConficuration() {
        
    }
}

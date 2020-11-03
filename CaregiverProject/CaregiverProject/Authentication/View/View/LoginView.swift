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
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subTitleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Please, Sign In"
        let font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var username: UITextField = {
        var text = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        text.attributedPlaceholder = attributedPlaceholder
        text.borderStyle = .roundedRect
        text.textAlignment = .center
        text.keyboardType = .emailAddress
        text.textContentType = .emailAddress
        text.autocapitalizationType = .none
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var password: UITextField = {
        var text = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        text.attributedPlaceholder = attributedPlaceholder
        text.borderStyle = .roundedRect
        text.textAlignment = .center
        text.textContentType = .password
        text.isSecureTextEntry = true
        text.autocapitalizationType = .none
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var feedBackLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Incorrect username or passowrd. Please try again."
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var registerButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var signInButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Sing In", for: .normal)
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

extension LoginView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(username)
        addSubview(password)
        addSubview(feedBackLabel)
        addSubview(registerButton)
        addSubview(signInButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subTitleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            username.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            username.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            username.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            password.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 15),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 25),
            
            feedBackLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            feedBackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedBackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

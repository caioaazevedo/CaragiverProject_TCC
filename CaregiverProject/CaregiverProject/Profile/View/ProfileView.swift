//
//  ProfileView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

final class ProfileView: UIView {
    
    private let textFieldDelegate = TextFieldDelegate()
    var profileImageSize: CGFloat { Metrics.Device.width*0.5 }
    var infoSpacing: CGFloat { 12 }
    var stackSpacing: CGFloat { 16 }
    
    lazy var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Elder's Profile"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var taskButton: CustomButton = {
        let button = CustomButton(type: .primary)
        button.setTitle("Routine", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var profileImageBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowRadius = 6
        view.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: profileImageSize, height: profileImageSize), cornerRadius: profileImageSize/2).cgPath
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        var image = UIImageView(frame: .zero)
        image.image = UIImage(named: "profileIcon")
        image.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = profileImageSize/2
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameTextField: UITextField = {
        let text = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let font = UIFont.preferredFont(forTextStyle: .title2)
        text.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        text.textAlignment = .center
        text.borderStyle = .roundedRect
        text.placeholder = "Elder's name"
        text.delegate = textFieldDelegate
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var imageButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var ageTextField = buildTextField()
    lazy var bloodTypeTextField = buildTextField()
    lazy var insuranceTextField = buildTextField()
    lazy var idTextField = buildTextField()
    lazy var phoneNumberTextField = buildTextField()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment    = .fill
        stack.axis         = .vertical
        stack.distribution = .fill
        stack.spacing = stackSpacing
        stack.addArrangedSubview(buildStackView(title: "Age", textField: ageTextField))
        stack.addArrangedSubview(buildStackView(title: "Blood Type", textField: bloodTypeTextField))
        stack.addArrangedSubview(buildStackView(title: "Health Insurance", textField: insuranceTextField))
        stack.addArrangedSubview(buildStackView(title: "ID", textField: idTextField))
        let phoneNumberStack = buildStackView(title: "Phone Number", textField: phoneNumberTextField)
        if let lastSeparator = phoneNumberStack.arrangedSubviews.last {
            phoneNumberStack.removeArrangedSubview(lastSeparator)
            lastSeparator.removeFromSuperview()
        }
        stack.addArrangedSubview(phoneNumberStack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var infoScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.addSubview(infoStackView)
        scroll.layoutMargins.left = 20
        scroll.alwaysBounceVertical = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        profileImageBackground.addSubview(profileImage)
        addSubview(profileImageBackground)
        addSubview(titleLabel)
        addSubview(imageButton)
        addSubview(taskButton)
        addSubview(nameTextField)
        addSubview(infoScrollView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            profileImageBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageBackground.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            profileImageBackground.heightAnchor.constraint(equalToConstant: profileImageSize),
            profileImageBackground.widthAnchor.constraint(equalToConstant: profileImageSize),

            profileImage.centerXAnchor.constraint(equalTo: profileImageBackground.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: profileImageBackground.centerYAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: profileImageSize),
            profileImage.widthAnchor.constraint(equalToConstant: profileImageSize),
            
            imageButton.topAnchor.constraint(equalTo: profileImage.topAnchor),
            imageButton.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            imageButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            imageButton.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor),
            
            taskButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            taskButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: taskButton.bottomAnchor, constant: 40),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -32),
            
            infoScrollView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),
            infoScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            infoScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            infoScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            infoStackView.topAnchor.constraint(equalTo: infoScrollView.topAnchor, constant: stackSpacing),
            infoStackView.leadingAnchor.constraint(equalTo: infoScrollView.layoutMarginsGuide.leadingAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: infoScrollView.bottomAnchor, constant: -stackSpacing),
        ])
    }
    
    func setUpAditionalConficuration() {
        layoutMargins.left = 2
        layoutMargins.right = 2
        backgroundColor = .white
        nameTextField.applyShaddow(cornerRadius: 2, opacity: 0.2)
        phoneNumberTextField.keyboardType = .numberPad
        ageTextField.keyboardType = .numberPad
    }
}

private extension ProfileView {
    
    func buildTextField() -> UITextField {
        let textField = UITextField()
        let font: UIFont = .preferredFont(forTextStyle: .title3)
        textField.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        textField.delegate = textFieldDelegate
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func buildLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        let font: UIFont = .preferredFont(forTextStyle: .title3)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func buildStackView(title: String, textField: UITextField) -> UIStackView {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = infoSpacing
        let label = buildLabel()
        label.text = title
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(buildSeparator())
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func buildSeparator() -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: Metrics.Device.width - 25).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

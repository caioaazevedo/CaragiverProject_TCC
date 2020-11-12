//
//  ProfileView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

final class ProfileView: UIView{
    
    var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Perfil do Idoso"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profileIcon")
        view.layer.borderWidth = 1
        view.contentMode = .scaleAspectFit        
        view.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = (UIScreen.main.bounds.width*0.50)/2
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameHintLabel: UILabel = {
        let view = UILabel()
        view.text = "Nome do Idoso"
        view.textColor  = UIColor.black
        view.adjustsFontForContentSizeCategory = true
        let font = UIFont.boldSystemFont(ofSize: 22)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.textColor  = UIColor.black
        view.adjustsFontForContentSizeCategory = true        
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainTextField: UITextField = {
        var text = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        text.textAlignment = .center
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var secTextField: UITextField = {
        var text = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        text.textAlignment = .center
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var ageHintLabel: UILabel = {
        let view = UILabel()
        view.text = "Idade do Idoso"
        view.textColor  = UIColor.black
        view.adjustsFontForContentSizeCategory = true
        let font = UIFont.boldSystemFont(ofSize: 22)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ageLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.textColor  = UIColor.black
        view.adjustsFontForContentSizeCategory = true
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    lazy var imageButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var notesField: UITextView  = {
        let view = UITextView(frame: .zero)
        view.text = "Elder's notes"
        view.font = UIFont.systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainButton: UIButton = {
        var view = UIButton(frame: .zero)
        view.setTitle("Edit", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(titleLabel)
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(ageLabel)
        self.addSubview(notesField)
        self.addSubview(mainButton)
        self.addSubview(imageButton)
        self.addSubview(mainTextField)
        self.addSubview(secTextField)
        self.addSubview(nameHintLabel)
        self.addSubview(ageHintLabel)
        
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -100),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.Device.height*0.50),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.50),
            
            imageButton.topAnchor.constraint(equalTo: profileImage.topAnchor),
            imageButton.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            imageButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            imageButton.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor),
         
            nameHintLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameHintLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 0),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 30),
            
            mainTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            mainTextField.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5),
                        
            ageHintLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ageHintLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant:90),
            
            ageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ageLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 120),
            
            secTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            secTextField.centerYAnchor.constraint(equalTo: ageLabel.centerYAnchor),
            secTextField.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5),
            
            notesField.centerXAnchor.constraint(equalTo: centerXAnchor),
            notesField.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -10),
            
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 180),
            mainButton.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5)
        ])
    }
    
    func setUpAditionalConficuration() {
        self.backgroundColor = .white
    }
    
    
}

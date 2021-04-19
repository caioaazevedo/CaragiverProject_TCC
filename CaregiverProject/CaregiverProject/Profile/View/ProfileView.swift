//
//  ProfileView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

final class ProfileView: UIView{
    
    var presentCallback: () -> () = {}
    
    var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Elder's Profile"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var taskButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "taskIcon"), for: .normal)
        button.addTarget(self, action: #selector(presentTaskView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var profileImage: UIImageView = {
        var image = UIImageView(frame: .zero)
        image.image = UIImage(named: "profileIcon")
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = (UIScreen.main.bounds.width*0.50)/2
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameHintLabel: UILabel = {
        let view = UILabel()
        view.text = "Elder's Name"
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
        view.text = "Elder's Age"
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
    
    @objc func presentTaskView(){
        presentCallback()
    }
}

extension ProfileView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(taskButton)
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
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            taskButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            taskButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.Device.width*0.50),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.50),
            
            imageButton.topAnchor.constraint(equalTo: profileImage.topAnchor),
            imageButton.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            imageButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            imageButton.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor),
         
            nameHintLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameHintLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameHintLabel.bottomAnchor, constant: 30),
            
            mainTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            mainTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            mainTextField.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5),
                        
            ageHintLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ageHintLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            
            ageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: ageHintLabel.bottomAnchor, constant: 30),
            
            secTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            secTextField.topAnchor.constraint(equalTo: ageLabel.topAnchor),
            secTextField.bottomAnchor.constraint(equalTo: ageLabel.bottomAnchor),
            secTextField.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5),
            
            notesField.centerXAnchor.constraint(equalTo: centerXAnchor),
            notesField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor,constant: 30),
            
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.topAnchor.constraint(equalTo: secTextField.bottomAnchor, constant: 20),
            mainButton.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5)
        ])
    }
    
    func setUpAditionalConficuration() {
        self.backgroundColor = .white
    }
    
    
}

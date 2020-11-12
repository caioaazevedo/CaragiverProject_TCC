//
//  ProfileView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

final class ProfileView: UIView{
    lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profileIcon")
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = view.frame.height/2
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Elder's name"
        view.textColor  = UIColor.black
        view.adjustsFontForContentSizeCategory = true        
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ageLabel: UILabel = {
        let view = UILabel()
        view.text = "Elder's age"
        view.textColor  = UIColor.black
        view.adjustsFontForContentSizeCategory = true
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
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
        view.setTitleColor(.systemBlue, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(ageLabel)
        self.addSubview(notesField)
        self.addSubview(mainButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -150),
         
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -60),
            
            ageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ageLabel.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -30),
            
            notesField.centerXAnchor.constraint(equalTo: centerXAnchor),
            notesField.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -10),
            
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 20),
        ])
    }
    
    func setUpAditionalConficuration() {
        self.backgroundColor = .white
    }
    
    
}

//
//  ProfileView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit

final class ProfileView: UIView{
    
    private let tableViewDelegate = TableViewDelegate()
    private let textFieldDelegate = TextFieldDelegate()
    var profileImageSize: CGFloat { Metrics.Device.width*0.5 }
        
    lazy var backView: UIView = {
        let rect = CGRect(origin: .zero, size: CGSize(width: Metrics.Device.width, height: Metrics.Device.height*0.5))
        let view = UIView(frame: rect)
        view.backgroundColor = .white
        return view
    }()
    
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var profileImageBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        view.layer.shadowRadius = 6
        view.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: profileImageSize, height: profileImageSize), cornerRadius: profileImageSize/2).cgPath
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        var image = UIImageView(frame: .zero)
        image.image = UIImage(named: "profileIcon")
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = profileImageSize/2
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameTextField: UITextField = {
        let text = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
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
    
    lazy var infoTableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: ProfileInfoCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.delegate = tableViewDelegate
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(backView)
        profileImageBackground.addSubview(profileImage)
        addSubview(profileImageBackground)
        addSubview(titleLabel)
        addSubview(taskButton)
        addSubview(imageButton)
        addSubview(nameTextField)
        addSubview(infoTableView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            taskButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 50),
            taskButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            profileImageBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageBackground.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
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
            
            nameTextField.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 32),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -32),
            
            infoTableView.topAnchor.constraint(equalTo: backView.bottomAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setUpAditionalConficuration() {
        layoutMargins.left = 20
        layoutMargins.right = 20
        backgroundColor = #colorLiteral(red: 0.9097241759, green: 0.9098550677, blue: 0.9096955061, alpha: 1)
        backView.applyShaddow(opacity: 0.3)
    }
}

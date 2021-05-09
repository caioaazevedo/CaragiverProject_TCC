//
//  FamilyTreeCollectionViewCell.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeCell: UICollectionViewCell {
    
    static let identifier = "FamilyTreeCell"
    
    var imageSize: CGFloat { 80 }
    
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = #imageLiteral(resourceName: "profileIcon")
        imageView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageSize/2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hierarchy: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.5019147992, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FamilyTreeCell: ViewCodeProtocol{
    func setUpViewHierarchy() {
        contentView.addSubview(backView)
        backView.addSubview(imageView)
        backView.addSubview(nameView)
        nameView.addSubview(name)
//        backView.addSubview(hierarchy)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),
            
            nameView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            name.centerXAnchor.constraint(equalTo: nameView.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: nameView.centerYAnchor),
            name.leadingAnchor.constraint(greaterThanOrEqualTo: nameView.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(lessThanOrEqualTo: nameView.trailingAnchor, constant: -20),
            
//            hierarchy.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            hierarchy.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
//            hierarchy.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
//            hierarchy.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        backView.applyShaddow(cornerRadius: 10)
    }
    
}

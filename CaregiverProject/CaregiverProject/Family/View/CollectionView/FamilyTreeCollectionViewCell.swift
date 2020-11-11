//
//  FamilyTreeCollectionViewCell.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.backgroundColor = #colorLiteral(red: 0.9018817544, green: 0.9020115733, blue: 0.901853323, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
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

extension FamilyTreeCollectionViewCell: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(name)
        addSubview(hierarchy)
        addSubview(imageView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageView.frame.height),
            imageView.widthAnchor.constraint(equalToConstant: imageView.frame.width),
            
            name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            hierarchy.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hierarchy.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            hierarchy.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            hierarchy.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}

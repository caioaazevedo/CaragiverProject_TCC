//
//  FamilyTreeView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

final class FamilyTreeView: UIView{
    
    lazy var elderImage: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = image
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.backgroundColor = #colorLiteral(red: 0.9018817544, green: 0.9020115733, blue: 0.901853323, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var elderName: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Drauzio"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var breakLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.9018817544, green: 0.9020115733, blue: 0.901853323, alpha: 1)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: FamilyTreeCollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 170)
        let collectionView = FamilyTreeCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FamilyTreeCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension FamilyTreeView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(collectionView)
        addSubview(elderName)
        addSubview(elderImage)
        addSubview(breakLine)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            elderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            elderImage.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 25),
            elderImage.heightAnchor.constraint(equalToConstant: elderImage.frame.height),
            elderImage.widthAnchor.constraint(equalToConstant: elderImage.frame.width),
            
            elderName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            elderName.topAnchor.constraint(equalTo: elderImage.bottomAnchor, constant: 16),
            elderName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            elderName.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            
            breakLine.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            breakLine.topAnchor.constraint(equalTo: elderName.bottomAnchor, constant: 32),
            breakLine.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            breakLine.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            breakLine.heightAnchor.constraint(equalToConstant: 5),
            
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: breakLine.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}

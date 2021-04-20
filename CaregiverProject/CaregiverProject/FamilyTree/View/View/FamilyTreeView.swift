//
//  FamilyTreeView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

final class FamilyTreeView: UIView{
    
    var imageSize: CGFloat { 150 }
    var cellSpacing: CGFloat { Metrics.Device.width/4 - cellSize.width/2 }
    var cellSize: CGSize { CGSize(width: 125, height: 170) }
    
    lazy var imageBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var elderImage: UIImageView = {
        let image = UIImage(named: "profileIcon")
        let imageView = UIImageView(frame: .zero)
        imageView.image = image
        imageView.layer.cornerRadius = imageSize/2
        imageView.clipsToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 0.9018817544, green: 0.9020115733, blue: 0.901853323, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var elderName: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Elder"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var groupInviteLabel: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Convidar alguém pro grupo", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var breakLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.9018817544, green: 0.9020115733, blue: 0.901853323, alpha: 1)
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: layoutMargins.top,
            left: cellSpacing,
            bottom: layoutMargins.bottom,
            right: cellSpacing
        )
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = cellSpacing
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.headerReferenceSize = CGSize(width: Metrics.Device.width, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FamilyTreeCell.self, forCellWithReuseIdentifier: FamilyTreeCell.identifier)
        collectionView.register(
            FamilyTreeHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: FamilyTreeHeaderView.identifier
        )
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layoutMargins.left = 20
        layoutMargins.right = 20
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FamilyTreeView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        imageBackground.addSubview(elderImage)
        addSubview(imageBackground)
        addSubview(collectionView)
        addSubview(elderName)
        addSubview(breakLine)
        addSubview(groupInviteLabel)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            imageBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageBackground.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 25),
            imageBackground.heightAnchor.constraint(equalToConstant: imageSize),
            imageBackground.widthAnchor.constraint(equalToConstant: imageSize),
            
            elderImage.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor),
            elderImage.centerYAnchor.constraint(equalTo: imageBackground.centerYAnchor),
            elderImage.heightAnchor.constraint(equalToConstant: imageSize),
            elderImage.widthAnchor.constraint(equalToConstant: imageSize),
            
            elderName.centerXAnchor.constraint(equalTo: centerXAnchor),
            elderName.topAnchor.constraint(equalTo: imageBackground.bottomAnchor, constant: 16),
            elderName.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            elderName.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            groupInviteLabel.topAnchor.constraint(equalTo: elderName.bottomAnchor,constant: 10),
            groupInviteLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            groupInviteLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            breakLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            breakLine.topAnchor.constraint(equalTo: groupInviteLabel.bottomAnchor, constant: 12),
            breakLine.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            breakLine.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            breakLine.heightAnchor.constraint(equalToConstant: 5),
            
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: breakLine.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageBackground.applyShaddow(cornerRadius: imageSize/2, opacity: 0.3)
    }
}

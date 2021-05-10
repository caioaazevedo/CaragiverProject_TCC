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
    
    lazy var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.text = "Family"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowRadius = 6
        view.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: imageSize, height: imageSize), cornerRadius: imageSize/2).cgPath
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var elderImage: UIImageView = {
        let image = UIImage(named: "profileIcon")
        let imageView = UIImageView(frame: .zero)
        imageView.image = image
        imageView.layer.cornerRadius = imageSize/2
        imageView.clipsToBounds = true
        imageView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
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
    
    lazy var inviteButton: UIButton = {
        let button = CustomButton(type: .primary)
        button.setTitle("Invite ", for: .normal)
        let image = UIImage(systemName: "square.and.arrow.up")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.semanticContentAttribute = .forceRightToLeft
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
        addSubview(titleLabel)
        imageBackground.addSubview(elderImage)
        addSubview(imageBackground)
        addSubview(collectionView)
        addSubview(elderName)
        addSubview(breakLine)
        addSubview(inviteButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            imageBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageBackground.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
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
            
            inviteButton.topAnchor.constraint(equalTo: elderName.bottomAnchor,constant: 10),
            inviteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            breakLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            breakLine.topAnchor.constraint(equalTo: inviteButton.bottomAnchor, constant: 12),
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
    }
}

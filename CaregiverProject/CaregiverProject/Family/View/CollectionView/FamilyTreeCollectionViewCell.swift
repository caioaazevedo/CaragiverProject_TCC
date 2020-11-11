//
//  FamilyTreeCollectionViewCell.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeCollectionViewCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hierarchy: UILabel = {
        let label = UILabel(frame: .zero)
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
        addSubview(image)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .blue
    }
    
}

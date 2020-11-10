//
//  FamilyTreeCollectionView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeCollectionView: UICollectionView{
    
    lazy var familyTreeCell: FamilyTreeCollectionViewCell = {
        let cell = FamilyTreeCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return cell
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FamilyTreeCollectionView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(familyTreeCell)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([])
    }
    
    func setUpAditionalConficuration() {}
    
}

//
//  FamilyTreeCollectionView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeCollectionView: UICollectionView{
    
    lazy var familyTreeCell: FamilyTreeCollectionViewCell = {
        let cell = FamilyTreeCollectionViewCell(frame: .zero)
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
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}

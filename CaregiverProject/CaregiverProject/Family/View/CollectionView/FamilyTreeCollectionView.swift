//
//  FamilyTreeCollectionView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeCollectionView: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FamilyTreeCollectionView: ViewCodeProtocol{
    func setUpViewHierarchy() {}
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}

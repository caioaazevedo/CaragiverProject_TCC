//
//  FamilyTreeView.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

final class FamilyTreeView: UIView{
    
    lazy var collectionView: FamilyTreeCollectionView = {
        let collectionView = FamilyTreeCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewLayout())
        collectionView.register(FamilyTreeCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension FamilyTreeView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setUpViewConstraints() {}
    
    func setUpAditionalConficuration() {}
}

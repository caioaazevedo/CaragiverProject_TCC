//
//  FamilyTree+DD.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

extension FamilyTreeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FamilyTreeCollectionViewCell ?? FamilyTreeCollectionViewCell()
        cell.name.text = sections[indexPath.section].members[indexPath.row]
        cell.hierarchy.text = "Filho"
        cell.layer.cornerRadius = 25
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = #colorLiteral(red: 0.6979769468, green: 0.6980791688, blue: 0.6979545951, alpha: 1)
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? FamilyTreeCollectionReusableView ?? FamilyTreeCollectionReusableView()
        header.headerLabel.text = sections[indexPath.section].header
        return header
    }
    
}

extension FamilyTreeViewController: UICollectionViewDelegate{
    
}

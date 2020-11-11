//
//  FamilyTree+DD.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

extension FamilyTreeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FamilyTreeCollectionViewCell ?? FamilyTreeCollectionViewCell()
        cell.name.text = members[indexPath.row]
        cell.hierarchy.text = "Filho"
        cell.image.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return cell
    }
    
    
}

extension FamilyTreeViewController: UICollectionViewDelegate{
    
}

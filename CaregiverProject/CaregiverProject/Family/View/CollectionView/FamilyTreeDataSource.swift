//
//  FamilyTree+DD.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeDataSource: NSObject {
    private let sections: [String: Members]
    private var memberTypes: [String] {
        MemberType.allCases.map { $0.title }
    }
    
    init(members: Members) {
        sections = Dictionary(
            grouping: members,
            by: { member in member.memberType.title }
        )
    }
}

extension FamilyTreeDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let memberType = memberTypes[section]
        return sections[memberType]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? FamilyTreeCollectionViewCell else {
            fatalError("Family Cell not registered!")
        }
        let memberType = memberTypes[indexPath.section]
        if let member = sections[memberType]?[indexPath.row] {
            cell.name.text = member.name
            cell.imageView.image = member.image
            cell.hierarchy.text = member.memberType.title
            cell.layer.cornerRadius = 25
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = #colorLiteral(red: 0.6979769468, green: 0.6980791688, blue: 0.6979545951, alpha: 1)
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? FamilyTreeCollectionReusableView else {
            fatalError("Header not registered!")
        }
        header.headerLabel.text = memberTypes[indexPath.section]
        return header
    }
}

//
//  FamilyTree+DD.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit

class FamilyTreeDataSource: NSObject {
    private var sections = [String: Members]()
    private var memberTypes: [String] {
        MemberType.allCases.map { $0.title }
    }
    
    func update(members: Members) {
        sections = Dictionary(
            grouping: members,
            by: { member in member.memberType.title }
        )
    }
}

extension FamilyTreeDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        memberTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let memberType = memberTypes[section]
        return sections[memberType]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FamilyTreeCell.identifier, for: indexPath) as? FamilyTreeCell else {
            fatalError("Family Cell not registered!")
        }
        let memberType = memberTypes[indexPath.section]
        if let member = sections[memberType]?[indexPath.row] {
            cell.name.text = member.name
            cell.imageView.image = member.image ?? #imageLiteral(resourceName: "profileIcon")
            cell.hierarchy.text = member.memberType.title
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FamilyTreeHeaderView.identifier, for: indexPath) as? FamilyTreeHeaderView else {
            fatalError("Header not registered!")
        }
        header.headerLabel.text = memberTypes[indexPath.section]
        return header
    }
}

//
//  NewEventModalView+DD.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

extension NewEventModalView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modalType == .category ? categories.count : responsibles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch modalType {
        case .category:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryModalTableViewCell.identifier) as! CategoryModalTableViewCell
            cell.setUp()
            cell.categoryName.text = categories[indexPath.row].rawValue
            cell.color.backgroundColor = colors[indexPath.row]
            cell.setCornerRadius()
            return cell
        case .responsible:
            let cell = tableView.dequeueReusableCell(withIdentifier: ResponsibleModalTableViewCell.identifier) as! ResponsibleModalTableViewCell
            cell.setUp()
            let member = responsibles[indexPath.row]
            cell.responsibleName.text = member.name
            cell.responsibleImage.image = member.image
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch modalType {
        case .category:
            delegate?.dismissModalView(category: categories[indexPath.row])
        case .responsible:
            delegate?.dismissModalView(responsible: responsibles[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}




//
//  NewEventModalView+DD.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

extension NewEventModalView: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryModalTableViewCell.identifier) as! CategoryModalTableViewCell
        cell.setUp()
        cell.categoryName.text = categories[indexPath.row].rawValue
        cell.color.backgroundColor = colors[indexPath.row]
        cell.setCornerRadius()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.dismissModalView(category: categories[indexPath.row])
    }
}




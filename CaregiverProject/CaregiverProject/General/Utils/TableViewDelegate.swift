//
//  TableViewDelegate.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 21/04/21.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

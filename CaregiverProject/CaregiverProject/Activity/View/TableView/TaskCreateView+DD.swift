//
//  TaskCreateView+DD.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 07/04/21.
//

import UIKit

extension TaskCreateView: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CreateTaskCell
        cell.title.text = taskTypes[indexPath.row]
        cell.icon.image = UIImage(named: taskIcons[indexPath.row])!
        return cell
    }
    
    
}



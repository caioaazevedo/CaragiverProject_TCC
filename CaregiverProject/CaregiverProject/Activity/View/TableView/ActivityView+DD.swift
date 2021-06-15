//
//  Activity+DD.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit

extension ActivityView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModel.tasks.count == 0 {
            return 1
        }
        return viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        cell.contentView.isUserInteractionEnabled = false
        if viewModel.tasks.count == 0 {
            cell.check.isHidden = true
            cell.icon.isHidden = true
            cell.date.isHidden = true
            cell.deleteButton.isHidden = true
            cell.title.text = "The elder doesn't have any tasks yet..."
            return cell
        } else {
            cell.check.isHidden = false
            cell.icon.isHidden = false
            cell.date.isHidden = false
            cell.deleteButton.isHidden = false

            if viewModel.tasks[indexPath.section].isCompleted{
                cell.check.setImage(UIImage(named: "checked"), for: .normal)
            } else{
                cell.check.setImage(UIImage(named: "unchecked"), for: .normal)
            }
            cell.tapCallback = { [self] in
                viewModel.tasks[indexPath.section].isCompleted.toggle()
                tableView.reloadData()
            }
            
            cell.deleteTaskCallback = { [self] name in
                viewModel.tasks.removeAll(where: {$0.name == name})
                tableView.reloadData()
            }
            
            cell.title.text = viewModel.tasks[indexPath.section].name
            cell.icon.image = UIImage(named: viewModel.tasks[indexPath.section].icon)!
            cell.date.text = "\(viewModel.tasks[indexPath.section].date)"
            return cell
        }
    }
    
}

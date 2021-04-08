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
        return viewModel.tasks.count;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        cell.contentView.isUserInteractionEnabled = false
        if viewModel.tasks[indexPath.section].isCompleted{
            cell.check.setImage(UIImage(named: "checked"), for: .normal)
        } else{
            cell.check.setImage(UIImage(named: "unchecked"), for: .normal)
        }
        cell.tapCallback = { [self] in
            viewModel.tasks[indexPath.section].isCompleted.toggle()
            tableView.reloadData()
        }
        cell.title.text = viewModel.tasks[indexPath.section].name
        cell.icon.image = viewModel.tasks[indexPath.section].icon
        cell.date.text = "\(viewModel.tasks[indexPath.section].date)"
        return cell
    }
    
}

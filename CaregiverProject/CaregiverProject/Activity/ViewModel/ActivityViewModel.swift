//
//  ActivityViewModel.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 08/04/21.
//

import UIKit

struct ActivityViewModel{
    
    var tasks: Tasks = [
        .init(name: "Banho", date: Date().getFormattedDate(), icon: UIImage(named: "hygiene")!, isCompleted: false),
        .init(name: "Café da manhã", date: Date().getFormattedDate(), icon: UIImage(named: "break")!, isCompleted: false),
        .init(name: "Colocar para ver TV", date: Date().getFormattedDate(), icon: UIImage(named: "clock")!, isCompleted: false),
        .init(name: "Almoço", date: Date().getFormattedDate(), icon: UIImage(named: "food")!, isCompleted: false),
        .init(name: "Soneca", date: Date().getFormattedDate(), icon: UIImage(named: "sleep")!, isCompleted: false)]
    
    mutating func addTask(task: Task){
        self.tasks.append(task)
    }
}

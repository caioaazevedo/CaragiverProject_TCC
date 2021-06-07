//
//  ActivityViewModel.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 08/04/21.
//

import UIKit
import FirebaseDatabase

struct ActivityViewModel{
    
    var DBworker = Database.database().reference().child("activities").child(UserSession.shared.familyID ?? "")
    
    var tasks: Tasks = []
    
    mutating func addTask(task: Task){
        self.tasks.append(task)
    }
    
    func fetchFromFirebase(completion: @escaping ((Tasks) -> ())){
        var tasks: Tasks = []
        DBworker.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? NSDictionary else {return}
            dictionary.allKeys.forEach { (value) in
                let converted = dictionary[value] as? NSDictionary
                if let day = converted?["specificDay"]{
                    var task = Task(name: converted?["name"] as! String,
                                    date: converted?["date"] as! String,
                                    icon: converted?["icon"] as! String,
                                    isCompleted: converted?["isCompleted"] as! Bool,
                                    specificDay: day as! Int)
                    
                    if task.specificDay != Date().getNumber() {
                        task.isCompleted = false
                    }
                    
                    tasks.append(task)
                }
            }
            completion(tasks)            
        }
    }
    
    
    func uploadToFirebase(){
        var fbTasks: [String:Any] = [:]
        tasks.forEach({ task in
            let taskDict: [String:Any] = ["name": task.name,
                                          "date": task.date,
                                          "icon": task.icon,
                                          "specificDay": task.specificDay,
                                          "isCompleted": task.isCompleted
            ]
            fbTasks[UUID().uuidString] = taskDict
        })
        DBworker.setValue(fbTasks)
    }
    
}

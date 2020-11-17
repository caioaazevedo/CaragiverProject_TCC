//
//  ElderManager.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 12/11/20.
//

import Foundation

class ElderManager: ObservableObject{
    @Published var elderData: ProfileEntity?
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(recieveValue(notification:)), name: .elderData, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .elderData, object: nil)
    }
    
    @objc func recieveValue(notification: NSNotification){
        if let value = notification.userInfo?["elderData"] as? ProfileEntity{
            self.elderData = value
        }
    }
}

//
//  AppUtility.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 11/11/20.
//

import UIKit

struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
}

//
//  FamilyTabBarController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 12/11/20.
//

import UIKit

class FamilyTabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}

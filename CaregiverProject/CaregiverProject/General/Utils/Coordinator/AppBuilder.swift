//
//  AppBuilder.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit

//struct AppBuilder {
//    func buildFamilyTabBarController() -> UITabBarController {
//        let familyTabBarController = MainTabBarController()
//        familyTabBarController.modalPresentationStyle = .fullScreen
//        
//        let familyTreeModule = FamilyBuilder.setUpFamilyTreeModule()
//        let profileModule = FamilyBuilder.setUpProfileModule()
//        let calendarModule = FamilyBuilder.setUpCalendarModule()
//        
//        familyTreeModule.assignSubscriber(publisher: profileModule.publisher)
//        familyTreeModule.callRefresh  = {
//            profileModule.setupData()
//        }
//        
//        familyTabBarController.viewControllers = [
//            familyTreeModule,
//            calendarModule,
//            profileModule
//        ]
//        return familyTabBarController
//    }
//}

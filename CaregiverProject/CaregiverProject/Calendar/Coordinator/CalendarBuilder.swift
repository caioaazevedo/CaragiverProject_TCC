//
//  CalendarBuilder.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 03/04/21.
//

import UIKit

struct CalendarBuilder {
    func setUpCalendarModule() -> CalendarViewController {
        let calendarModule = CalendarViewController()
        let calendarIcon = UITabBarItem(title: "Calendar", image: #imageLiteral(resourceName: "Calendar"), tag: 1)
        calendarModule.tabBarItem = calendarIcon
        
        return calendarModule
    }
}

//
//  CalendarViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit
import FSCalendar

class CalendarViewController: CustomViewController<CalendarView> {

    var formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpCalendar()
    }
    
    func setUpCalendar() {
        contentView.calendar.scrollDirection = .horizontal
        contentView.calendar.scope = .month
        contentView.calendar.locale = Locale(identifier: "en")
        
        contentView.calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20.0)
        contentView.calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 22.0)
        contentView.calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 18.0)
        contentView.calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        contentView.calendar.appearance.todayColor = .orange
        contentView.calendar.appearance.separators = .interRows
        
        contentView.calendar.delegate = self
        contentView.calendar.dataSource = self
    }

}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MMM-yyyy"
        print("DateSelected == \(formatter.string(from: date))")
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return true
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let eventDate = formatter.date(from: "03-04-2021") else { return 0 }
        
        if date.compare(eventDate) == .orderedSame {
            return 2
        }
        
        return 0
    }
}

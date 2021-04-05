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
        setUp()
    }
    
    func setUp() {
        contentView.calendar.delegate = self
        contentView.calendar.dataSource = self
        
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
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

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as! EventCell
        cell.setUp()
        cell.title.text = "Levar para o Destista"
        cell.personName.text = "Ricardo"
        cell.scheduleTime.text = "13:00"
        return cell
    }
}

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}

//
//  CalendarView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit
import FSCalendar

class CalendarView: UIView {
    
    lazy var calendar = buildCalendar()
    private lazy var calendarBackground = buildCalendarBackgroundView()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CalendarView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(calendarBackground)
        calendarBackground.addSubview(calendar)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            calendarBackground.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height * 0.1),
            calendarBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            calendarBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            calendarBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            
            calendar.topAnchor.constraint(equalTo: calendarBackground.topAnchor, constant: 5),
            calendar.leadingAnchor.constraint(equalTo: calendarBackground.leadingAnchor, constant: 5),
            calendar.trailingAnchor.constraint(equalTo: calendarBackground.trailingAnchor, constant: -5),
            calendar.bottomAnchor.constraint(equalTo: calendarBackground.topAnchor, constant: -5),
            
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        calendarBackground.applyShaddow()
    }
}

extension CalendarView {
    private func buildCalendar() -> FSCalendar {
        let view = FSCalendar(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func buildCalendarBackgroundView() -> UIView {
        let view = FSCalendar(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }
}

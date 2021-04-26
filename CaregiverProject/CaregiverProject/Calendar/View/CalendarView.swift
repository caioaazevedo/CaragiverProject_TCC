//
//  CalendarView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit
import FSCalendar

protocol CalendarViewDelegate: class {
    func createNewEvent()
}

class CalendarView: UIView {
    
    weak var delegate: CalendarViewDelegate?

    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Calendar"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var addEventButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let imageIcoin: UIImage? = UIImage(systemName: "plus.circle.fill")
        button.setImage(imageIcoin, for: .normal)
        button.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        return button
    }()

    var calendar: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
        calendar.locale = Locale(identifier: "en")
        
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20.0)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 22.0)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 18.0)
        calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        calendar.appearance.todayColor = .orange
        calendar.appearance.separators = .interRows
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    var calendarBackground: UIView = {
        let view = FSCalendar(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Events"
        let font = UIFont.preferredFont(forTextStyle: .title2)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.register(EventCell.self, forCellReuseIdentifier: EventCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- Actions

extension CalendarView {
    @objc func createEvent() {
        delegate?.createNewEvent()
    }
}

extension CalendarView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(addEventButton)
        addSubview(calendarBackground)
        addSubview(label)
        addSubview(tableView)
        calendarBackground.addSubview(calendar)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            
            addEventButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addEventButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addEventButton.widthAnchor.constraint(equalToConstant: 40),
            addEventButton.heightAnchor.constraint(equalToConstant: 40),
            
            calendarBackground.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            calendarBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            calendarBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            calendarBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35),
            
            calendar.topAnchor.constraint(equalTo: calendarBackground.topAnchor, constant: 5),
            calendar.leadingAnchor.constraint(equalTo: calendarBackground.leadingAnchor, constant: 5),
            calendar.trailingAnchor.constraint(equalTo: calendarBackground.trailingAnchor, constant: -5),
            calendar.bottomAnchor.constraint(equalTo: calendarBackground.topAnchor, constant: -5),
            
            label.topAnchor.constraint(equalTo: calendarBackground.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        calendarBackground.applyShaddow(cornerRadius: 10)
    }
}

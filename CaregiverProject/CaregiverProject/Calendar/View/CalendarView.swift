//
//  CalendarView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit
import FSCalendar

protocol CalendarViewDelegate: AnyObject {
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

    lazy var calendar: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
        calendar.locale = Locale(identifier: "en")
        
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20.0)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 22.0)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 18.0)
        calendar.appearance.weekdayTextColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        calendar.appearance.todayColor = .orange
        calendar.allowsSelection = true
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    lazy var calendarBackground: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.distribution = .fill
        stack.alignment = .fill
        stack.addArrangedSubview(calendar)
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var addEventButton: CustomButton = {
        let button = CustomButton(type: .primary)
        button.setTitle("Create Event", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        return button
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        let font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
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
        addSubview(calendarBackground)
        addSubview(addEventButton)
        addSubview(dateLabel)
        addSubview(tableView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            
            calendarBackground.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            calendarBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            calendarBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            calendarBackground.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3),
            
            addEventButton.topAnchor.constraint(equalTo: calendarBackground.bottomAnchor, constant: 30),
            addEventButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: addEventButton.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            tableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        calendarBackground.bringSubviewToFront(calendar)
        calendarBackground.applyShaddow(cornerRadius: 10)
    }
}

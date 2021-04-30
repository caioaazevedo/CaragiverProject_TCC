//
//  CalendarViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit
import FSCalendar
import Combine
import Firebase

class CalendarViewController: CustomViewController<CalendarView> {

    var formatter = DateFormatter()
    weak var coordinator: CalendarCoodinator?
    private var selectedDate: Date = Date() {
        didSet { viewModel.filterEvents(by: selectedDate) }
    }
    private var eventList: [EventModel] { viewModel.eventList }
    private var subscribers = Set<AnyCancellable>()
    private var viewModel = CalendarViewModel(dataManager: FamilyDataManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.fetchEvents()
    }
    
    func setUp() {
        setUpContentView()
        bindViewModel()
    }
    
    func setUpContentView() {
        contentView.delegate = self
        contentView.calendar.delegate = self
        contentView.calendar.dataSource = self
        
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.$eventList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.contentView.tableView.reloadData()
                self?.contentView.calendar.reloadData()
            }
            .store(in: &subscribers)
    }
    
    func addEvent(event: EventModel) {
        var newEvent = event
        newEvent.date = selectedDate
        viewModel.addEvent(newEvent)
        viewModel.fetchEvents()
    }
}

extension CalendarViewController: CalendarViewDelegate {
    func createNewEvent() {
        coordinator?.createNewEvent()
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.selectedDate = date
        contentView.dateLabel.text = date.formatDate()
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return true
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        viewModel.eventBackUp
            .filter { $0.date == date }
            .count
    }
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as! EventCell
        let event = eventList[indexPath.row]
        cell.setUp()
        cell.title.text = event.title
        cell.personName.text = event.responsible?.name
        cell.personImage.image = event.responsible?.image
        cell.scheduleTime.text = event.time
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

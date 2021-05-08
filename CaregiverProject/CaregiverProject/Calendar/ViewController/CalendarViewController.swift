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
    private var eventList: [EventModel] { viewModel.eventList }
    private var subscribers = Set<AnyCancellable>()
    private var viewModel = CalendarViewModel(dataManager: FamilyDataManager())
    private var selectedDate = Date() {
        willSet {
            contentView.dateLabel.text = newValue.formatDate()
            viewModel.filterEvents(by: newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.fetchEvents(at: selectedDate)
    }
    
    func setUp() {
        setUpContentView()
        bindViewModel()
        selectedDate = Date()
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
        do {
            try viewModel.validate(date: selectedDate)
            var newEvent = event
            newEvent.date = selectedDate
            viewModel.addEvent(newEvent)
            viewModel.filterEvents(by: selectedDate)
        } catch CalendarError.DateNodeValid(let title, let message) {
            showOkAlert(title: title, message: message)
        } catch { }
    }
    
    func editEvent(event: EventModel) {
        viewModel.updateEvent(event)
        viewModel.filterEvents(by: selectedDate)
    }
}

extension CalendarViewController: CalendarViewDelegate {
    func createNewEvent() {
        coordinator?.createNewEvent()
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if let cell = calendar.cell(for: date, at: monthPosition),
           let index = calendar.collectionView.indexPath(for: cell as UICollectionViewCell) {
            calendar.collectionView.reloadItems(at: [index])
        }
        calendar.deselect(date)
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        viewModel.eventBackUp
            .filter { $0.date?.formatDate() == date.formatDate() }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = viewModel.eventList[indexPath.row]
        coordinator?.showEvent(event: event)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let event = eventList[indexPath.row]
            viewModel.deleteEvent(event)
            viewModel.filterEvents(by: selectedDate)
        }
    }
}

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
    private var selectedDate: Date = Date()
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
            }
            .store(in: &subscribers)
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: date).uppercased()
    }
    
    func addEvent(event: EventModel) {
        viewModel.addEvent(event)
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
        contentView.dateLabel.text = formatDate(date)
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return true
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        
        // Indicador de Eventos no calendário
        formatter.dateFormat = "dd-MM-yyyy"
        guard let eventDate = formatter.date(from: "29-04-2021") else { return 0 }
        
        if date.compare(eventDate) == .orderedSame {
            return 2
        }
        return 0
    }
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as! EventCell
        cell.setUp()
        cell.title.text = eventList[indexPath.row].title
        cell.personName.text = eventList[indexPath.row].responsible
        cell.scheduleTime.text = eventList[indexPath.row].time
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

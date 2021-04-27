//
//  NewEventViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

enum NewEventCells: Int {
    case category
    case time
    case responsible
    case notes
}

class NewEventViewController: CustomViewController<NewEventView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    func setUpNavigation() {
        navigationController
    }
}

extension NewEventViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case NewEventCells.category.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            cell.setUp()
            cell.categoryName.text = "Saúde"
            
            return cell
        case NewEventCells.time.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: TimeTableViewCell.identifier, for: indexPath) as! TimeTableViewCell
            cell.setUp()
            
            return cell
        case NewEventCells.responsible.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ResponsibleTableViewCell.identifier, for: indexPath) as! ResponsibleTableViewCell
            cell.setUp()
            
            return cell
        case NewEventCells.notes.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier, for: indexPath) as! NotesTableViewCell
            cell.setUp(delegate: self)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension NewEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == NewEventCells.notes.rawValue {
            return 150
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}

extension NewEventViewController: UITextViewDelegate {
    
}

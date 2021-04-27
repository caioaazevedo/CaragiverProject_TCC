//
//  NewEventViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

enum NewEventSecondSectionCells: Int {
    case category
    case time
    case responsible
    case notes
}

enum NewEventFirstSectionCells: Int {
    case title
    case local
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
}

extension NewEventViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case NewEventFirstSectionCells.title.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as! TitleTableViewCell
                cell.setUp()
                
                return cell
            case NewEventFirstSectionCells.local.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: LocalTableViewCell.identifier, for: indexPath) as! LocalTableViewCell
                cell.setUp()
                
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case NewEventSecondSectionCells.category.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
                cell.setUp()
                cell.categoryName.text = "Saúde"
                
                return cell
            case NewEventSecondSectionCells.time.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: TimeTableViewCell.identifier, for: indexPath) as! TimeTableViewCell
                cell.setUp()
                
                return cell
            case NewEventSecondSectionCells.responsible.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: ResponsibleTableViewCell.identifier, for: indexPath) as! ResponsibleTableViewCell
                cell.setUp()
                
                return cell
            case NewEventSecondSectionCells.notes.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier, for: indexPath) as! NotesTableViewCell
                cell.setUp(delegate: self)
                
                return cell
            default:
                return UITableViewCell()
            }
        }
    }
}

extension NewEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == NewEventSecondSectionCells.notes.rawValue {
            return 150
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}

extension NewEventViewController: UITextViewDelegate {
    
}

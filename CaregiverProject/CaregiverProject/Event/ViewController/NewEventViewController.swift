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

protocol NewEventViewControllerDelegate: class {
    func presentModalView()
}

class NewEventViewController: CustomViewController<NewEventView> {
    
    weak var coordinator: NewEventCoodinator?
    weak var delegate: NewEventViewControllerDelegate?
    private var viewModel: EventViewModel
    
    init(viewModel: EventViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.delegate = self
        delegate = contentView
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
                cell.setUp(delegate: self)
                
                return cell
            case NewEventFirstSectionCells.local.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: LocalTableViewCell.identifier, for: indexPath) as! LocalTableViewCell
                cell.setUp(delegate: self)
                
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case NewEventSecondSectionCells.category.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
                cell.setUp()
                cell.categoryName.text = viewModel.event.category == nil ?
                    CategoryType.Others.rawValue :
                    viewModel.event.category?.rawValue
                
                return cell
            case NewEventSecondSectionCells.time.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: TimeTableViewCell.identifier, for: indexPath) as! TimeTableViewCell
                cell.setUp()
                if viewModel.event.time?.isEmpty == false {
                    cell.timeLabel.text = viewModel.event.time
                }
                
                return cell
            case NewEventSecondSectionCells.responsible.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: ResponsibleTableViewCell.identifier, for: indexPath) as! ResponsibleTableViewCell
                cell.setUp()
                if viewModel.event.responsible?.isEmpty == false {
                    cell.responsibleName.text = viewModel.event.responsible
                }
                
                return cell
            case NewEventSecondSectionCells.notes.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier, for: indexPath) as! NotesTableViewCell
                cell.setUp(delegate: self)
                if viewModel.event.notes?.isEmpty == false {
                    cell.notes.text = viewModel.event.notes
                }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            switch indexPath.row {
            case NewEventSecondSectionCells.category.rawValue:
                delegate?.presentModalView()
            default:
                break
            }
        }
    }
}

extension NewEventViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        viewModel.event.notes = textView.text
    }
}

extension NewEventViewController: TitleTableViewCellDelegate {
    func didChangeTitle(text: String) {
        viewModel.event.title = text
    }
}

extension NewEventViewController: LocalTableViewCellDelegate {
    func didChangeLocal(text: String) {
        viewModel.event.local = text
    }
}

extension NewEventViewController: NewEventViewCoordinator {
    func didTapCreate() {
        
    }
    
    func didChooseCategory(category: CategoryType) {
        viewModel.event.category = category
        contentView.tableView.reloadData()
    }
}
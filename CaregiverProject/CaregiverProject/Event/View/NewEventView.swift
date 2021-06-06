//
//  NewEventView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

protocol NewEventViewCoordinator: class {
    func didTapCreate()
    func didTapEdit()
    func didChooseCategory(category: CategoryType)
    func didChooseResponsible(responsible: Member)
}

class NewEventView: UIView {
    
    weak var delegate: NewEventViewCoordinator?
    var layoutConstraint : NSLayoutConstraint?
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        tableView.register(LocalTableViewCell.self, forCellReuseIdentifier: LocalTableViewCell.identifier)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.register(TimeTableViewCell.self, forCellReuseIdentifier: TimeTableViewCell.identifier)
        tableView.register(ResponsibleTableViewCell.self, forCellReuseIdentifier: ResponsibleTableViewCell.identifier)
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 0)
        tableView.separatorColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var mainButton: CustomButton = {
        let button = CustomButton(type: .secondary)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var modalView: NewEventModalView = {
        let view = NewEventModalView()
        view.backgroundColor = .white
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func createTap() {
        delegate?.didTapCreate()
    }
    @objc func editTap() {
        delegate?.didTapEdit()
    }
    
    func setUpTo(edit: Bool) {
        if edit {
            titleLabel.text = "Event Details"
            mainButton.setTitle("Save", for: .normal)
            mainButton.addTarget(self, action: #selector(editTap), for: .touchUpInside)
        } else {
            titleLabel.text = "New Event"
            mainButton.setTitle("Create", for: .normal)
            mainButton.addTarget(self, action: #selector(createTap), for: .touchUpInside)
        }
    }
}

extension NewEventView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(mainButton)
        addSubview(tableView)
        addSubview(modalView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            mainButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 456),
            
            modalView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            modalView.widthAnchor.constraint(equalToConstant: Metrics.Device.width),
            modalView.heightAnchor.constraint(equalToConstant: Metrics.Device.height*0.45)
        ])
        
        layoutConstraint = modalView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: Metrics.Device.height)
        layoutConstraint?.isActive = true
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = #colorLiteral(red: 0.9732231498, green: 0.9674372077, blue: 0.9776702523, alpha: 1)
    }
}

extension NewEventView: NewEventViewControllerDelegate {
    func presentModalView(type: NewEventModalType) {
        modalView.modalType = type
        modalView.titleLabel.text = type == .category ? "Categories:" : "Responsible:"
        modalView.tableView.reloadData()
        modalView.applyShaddow(cornerRadius: 20, opacity: 0.7)
        layoutConstraint?.constant = Metrics.Device.height*0.3
        
        UIView.animate(withDuration: 1, animations: { [self] in
            updateConstraints()
            layoutIfNeeded()
        })
    }
}

extension NewEventView: NewEventModalViewDelegate {
    func dismissModalView(responsible: Member) {
        self.delegate?.didChooseResponsible(responsible: responsible)
        layoutConstraint?.constant = Metrics.Device.height
        UIView.animate(withDuration: 1, animations: { [self] in
            layoutIfNeeded()
        })
    }
    
    func dismissModalView(category: CategoryType) {
        self.delegate?.didChooseCategory(category: category)
        layoutConstraint?.constant = Metrics.Device.height
        UIView.animate(withDuration: 1, animations: { [self] in
            layoutIfNeeded()
        })
    }
}

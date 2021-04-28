//
//  NewEventView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

protocol NewEventViewCoordinator: class {
    func didTapCreate()
    func didChooseCategory(category: CategoryType)
    func didChooseResponsible(responsible: String)
}

class NewEventView: UIView {
    
    weak var delegate: NewEventViewCoordinator?
    var layoutConstraint : NSLayoutConstraint?
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "New Event"
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
    
    lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Create", for: .normal)
        view.setTitleColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), for: .normal)
        view.contentEdgeInsets = .init(top: 8, left: 14, bottom: 8, right: 14)
        view.backgroundColor = .clear
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(createTap), for: .touchUpInside)
        return view
    }()
    
    lazy var modalView: NewEventModalView = {
        let view = NewEventModalView()
        view.backgroundColor = .white
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 10
        view.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor
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
}

extension NewEventView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(addButton)
        addSubview(tableView)
        addSubview(modalView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            
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
        layoutConstraint?.constant = Metrics.Device.height*0.3
        
        UIView.animate(withDuration: 1, animations: { [self] in
            updateConstraints()
            layoutIfNeeded()
        })
    }
}

extension NewEventView: NewEventModalViewDelegate {
    func dismissModalView(responsible: String) {
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

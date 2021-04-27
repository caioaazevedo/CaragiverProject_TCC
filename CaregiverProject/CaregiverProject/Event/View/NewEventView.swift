//
//  NewEventView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 26/04/21.
//

import UIKit

class NewEventView: UIView {
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
    
    var topStack: UIStackView = {
        var stack = UIStackView(frame: .zero)
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    var titleField: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Title"
        text.textAlignment = .center
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var localField: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Local"
        text.borderStyle = .roundedRect
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.register(TimeTableViewCell.self, forCellReuseIdentifier: TimeTableViewCell.identifier)
        tableView.register(ResponsibleTableViewCell.self, forCellReuseIdentifier: ResponsibleTableViewCell.identifier)
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 0)
        tableView.separatorColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Create", for: .normal)
        view.setTitleColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), for: .normal)
        view.contentEdgeInsets = .init(top: 8, left: 14, bottom: 8, right: 14)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(createTap), for: .touchUpInside)
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
        
    }
}

extension NewEventView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(topStack)
        topStack.addArrangedSubview(titleField)
        topStack.addArrangedSubview(localField)
        
        addSubview(addButton)
        addSubview(tableView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            topStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            topStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 70),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20),
            
            titleField.heightAnchor.constraint(equalToConstant: 40),
            localField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
}

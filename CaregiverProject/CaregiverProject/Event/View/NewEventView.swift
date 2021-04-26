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
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    var titleField: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Title"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var localField: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Local"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 0)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewEventView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(topStack)
        topStack.addArrangedSubview(titleField)
        topStack.addArrangedSubview(localField)
        
        addSubview(tableView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            topStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            topStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 70),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
    }
}

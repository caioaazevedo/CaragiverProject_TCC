//
//  NewEventModalView.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

protocol NewEventModalViewDelegate: class {
    func dismissModalView(category: CategoryType)
    func dismissModalView(responsible: Member)
}

enum NewEventModalType {
    case category
    case responsible
}

class NewEventModalView: UIView {
    weak var delegate: NewEventModalViewDelegate?
    let categories: [CategoryType] = [CategoryType.Health,
                                CategoryType.Fun,
                                CategoryType.Dentist,
                                CategoryType.Pharmacy,
                                CategoryType.Food,
                                CategoryType.Others]
    
    let colors: [UIColor] = [CategoryType.Health.color,
                             CategoryType.Fun.color,
                             CategoryType.Dentist.color,
                             CategoryType.Pharmacy.color,
                             CategoryType.Food.color,
                             CategoryType.Others.color]
    
    var responsibles = Members() {
        didSet { tableView.reloadData() }
    }
    
    var modalType: NewEventModalType = .category
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Categories:"
        let font = UIFont.preferredFont(forTextStyle: .title2)
        label.font = UIFontMetrics(forTextStyle: .title2).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.register(CategoryModalTableViewCell.self, forCellReuseIdentifier: CategoryModalTableViewCell.identifier)
        tableView.register(ResponsibleModalTableViewCell.self, forCellReuseIdentifier: ResponsibleModalTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 0)
        tableView.separatorColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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

extension NewEventModalView: ViewCodeProtocol {
    func setUpViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
    }
    
    func setUpAditionalConficuration() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

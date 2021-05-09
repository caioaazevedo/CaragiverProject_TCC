//
//  ActivityView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit

final class ActivityView: UIView{
    
    var viewModel: ActivityViewModel = .init()
    var layoutConstraint : NSLayoutConstraint?
                  
    
    lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.text = "Routine"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        return view
    }()
        
    lazy var addButton: UIButton = {
        let button = CustomButton(type: .secondary)
        button.setTitle("Add new Task", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentCreateTask), for: .touchUpInside)
        return button
    }()
    
    lazy var createTaskView: TaskCreateView = {
        let view = TaskCreateView()
        view.backgroundColor = .white
        view.addCallback = addTask
        view.cancelCallback = dismissView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        setUpView()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func presentCreateTask(){
        layoutConstraint?.constant = Metrics.Device.height*0.25
        
        UIView.animate(withDuration: 1, animations: { [self] in
            updateConstraints()
            layoutIfNeeded()
        })
    }
    
    func addTask(task: Task){
        viewModel.addTask(task: task)
        createTaskView.reset()
        tableView.reloadData()
        dismissView()
    }
    
    func dismissView(){
        layoutConstraint?.constant = Metrics.Device.height
        UIView.animate(withDuration: 1, animations: { [self] in
            layoutIfNeeded()
        })
    }
}

extension ActivityView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(mainLabel)
        addSubview(tableView)
        addSubview(addButton)
        addSubview(createTaskView)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor,constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor,constant: 10),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor,constant: -15),
//            tableView.heightAnchor.constraint(equalToConstant: Metrics.Device.height*0.8),
            
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor,constant: -10),
            
            createTaskView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            createTaskView.widthAnchor.constraint(equalToConstant: Metrics.Device.width),
            createTaskView.heightAnchor.constraint(equalToConstant: Metrics.Device.height*0.45)
                        
        ])
        
        layoutConstraint = createTaskView.centerYAnchor.constraint(equalTo: centerYAnchor,constant: Metrics.Device.height)
        layoutConstraint?.isActive = true
        
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        createTaskView.applyShaddow(cornerRadius: 20, opacity: 0.7)
    }
}

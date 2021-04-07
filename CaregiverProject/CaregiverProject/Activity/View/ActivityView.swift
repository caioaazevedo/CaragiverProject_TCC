//
//  ActivityView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit

final class ActivityView: UIView{
    
    var tasks: Tasks = [
        .init(name: "Banho", date: Date().getFormattedDate(), icon: UIImage(named: "hygiene")!, isCompleted: false),
        .init(name: "Café da manhã", date: Date().getFormattedDate(), icon: UIImage(named: "break")!, isCompleted: false),
        .init(name: "Colocar para ver TV", date: Date().getFormattedDate(), icon: UIImage(named: "clock")!, isCompleted: false),
        .init(name: "Almoço", date: Date().getFormattedDate(), icon: UIImage(named: "food")!, isCompleted: false),
        .init(name: "Soneca", date: Date().getFormattedDate(), icon: UIImage(named: "sleep")!, isCompleted: false)]
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Adicionar Tarefa", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.contentEdgeInsets = .init(top: 8, left: 14, bottom: 8, right: 14)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = .init(red: 0, green: 0, blue: 1, alpha: 1)
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
    
    func callReload(){
        self.tableView.reloadData()
    }
}

extension ActivityView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(tableView)
        addSubview(addButton)
        tableView.reloadData()
        
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor,constant: -20),
            tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor,constant: 20),
            tableView.heightAnchor.constraint(equalToConstant: Metrics.Device.height*0.8),
            
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -60),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false        
        
    }
}

//
//  TaskCreateView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 07/04/21.
//

import UIKit

final class TaskCreateView: UIView{
    
    var cancelCallback: () -> () = {}
    var addCallback: (Task) -> () = { _ in }
    var selectedCategory = 0
    
    let taskTypes: [String] = ["Higiene","Folga","Tempo","Comida","Cama"]
    let taskIcons: [String] = ["hygiene","break","clock","food","sleep"]
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.text = "Adicionar nova tarefa"
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var text: UITextField = {
        var view = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholder = NSAttributedString(string: "Nome da tarefa", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        view.attributedPlaceholder = attributedPlaceholder
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        view.textContentType = .name
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .time
        view.preferredDatePickerStyle = .inline
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero,style: .plain)
        view.register(CreateTaskCell.self, forCellReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancelar", for: .normal)
        view.setTitleColor(.red, for: .normal)
        view.contentEdgeInsets = .init(top: 8, left: 14, bottom: 8, right: 14)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(cancelTap), for: .touchUpInside)
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
        view.addTarget(self, action: #selector(addTap), for: .touchUpInside)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cancelTap(){
        cancelCallback()
    }
    
    @objc func addTap(){
        var iconName = "hygiene"
        switch selectedCategory{
        case 1:
            iconName = "break"
        case 2:
            iconName = "clock"
        case 3:
            iconName = "food"
        case 4:
            iconName = "sleep"
        default:
            iconName = "hygiene"
        }
        let task = Task(name: text.text ?? "Tarefa", date: datePicker.date.getFormattedDate(), icon: iconName, isCompleted: false)
        addCallback(task)
    }
    
    func reset(){
        text.text = ""
        datePicker.date = Date()
        selectedCategory = 0
    }
}

extension TaskCreateView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(title)
        addSubview(text)
        addSubview(datePicker)
        addSubview(tableView)
        addSubview(cancelButton)
        addSubview(addButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: topAnchor,constant: 20),

            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            text.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 20),
            text.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            
            datePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: text.bottomAnchor,constant: 20),
            datePicker.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.6),
            
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.topAnchor.constraint(equalTo: datePicker.bottomAnchor,constant: 5),
            tableView.heightAnchor.constraint(equalToConstant: 100),
            tableView.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.8),

            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            cancelButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 15),

            addButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            addButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 15)
//
        ])
    }
    
    func setUpAditionalConficuration() {
        tableView.delegate = self
        tableView.dataSource = self        
    }
    
}

//
//  TaskCreateView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 07/04/21.
//

import UIKit

final class TaskCreateView: UIView{
    
    private let textFieldDelegate = TextFieldDelegate()
    var cancelCallback: () -> () = {}
    var addCallback: (Task) -> () = { _ in }
    var selectedCategory = 0
    
    let taskTypes: [String] = ["Hygiene","Coffe","Free-time","Food","Sleep"]
    let taskIcons: [String] = ["hygiene","break","clock","food","sleep"]
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.text = "Add new Task"
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var text: UITextField = { [weak self] in
        var view = UITextField(frame: .zero)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholder = NSAttributedString(string: "Task name", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        view.attributedPlaceholder = attributedPlaceholder
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        view.textContentType = .name
        view.delegate = self?.textFieldDelegate
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
        let button = CustomButton(type: .cancel)
        button.setTitle("Cancel", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelTap), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = CustomButton(type: .tertiary)
        button.setTitle("Add Task", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addTap), for: .touchUpInside)
        return button
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
                
        let task = Task(name: text.text ?? "Task", date: datePicker.date.getFormattedDate(), icon: iconName, isCompleted: false, specificDay: Date().getNumber())
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
        addSubview(cancelButton)
        addSubview(addButton)
        addSubview(tableView)
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
            
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            cancelButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -20),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -20),
            
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.topAnchor.constraint(equalTo: datePicker.bottomAnchor,constant: 5),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20),
            tableView.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.8)

//
        ])
    }
    
    func setUpAditionalConficuration() {
        tableView.delegate = self
        tableView.dataSource = self        
    }
    
}

//
//  TaskCreateView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 07/04/21.
//

import UIKit

final class TaskCreateView: UIView{
    
    let taskTypes: [String] = ["Higiene,Folga,Tempo,Comida,Cama"]
    let taskIcons: [String] = ["hygiene","break","clock","food","sleep"]
    
    lazy var background: UIView = {
        let view = UIView(frame: CGRect(x: -Metrics.Device.width*0.5, y: 0, width: Metrics.Device.width, height: Metrics.Device.height*0.3))
        view.backgroundColor = .white
        return view
    }()
    
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
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero,style: .plain)
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TaskCreateView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(background)
        background.addSubview(title)
        background.addSubview(text)
        background.addSubview(tableView)
        background.addSubview(cancelButton)
        background.addSubview(addButton)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            
            title.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            title.topAnchor.constraint(equalTo: background.topAnchor,constant: 20),
            
            text.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            text.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 20),
            
            tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: text.bottomAnchor,constant: 20),
            
            cancelButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor,constant: -20),
            cancelButton.bottomAnchor.constraint(equalTo: background.bottomAnchor,constant: -30),
            
            addButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            addButton.bottomAnchor.constraint(equalTo: background.bottomAnchor,constant: -30)
            
        ])
    }
    
    
}

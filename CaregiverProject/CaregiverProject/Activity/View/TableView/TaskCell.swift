//
//  TaskCell.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit

class TaskCell: UITableViewCell{
        
    var tapCallback: () -> () = { }
    var deleteTaskCallback: (String) -> () = { _ in }
    
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var check: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "unchecked"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(tapCheckButton), for: .touchUpInside)
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Lunch"
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var icon: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = Metrics.Device.width*0.25/2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var date: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "12h00"
        let font = UIFont.preferredFont(forTextStyle: .title3)
        view.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var deleteButton: UIButton = {
        let view = UIButton(frame: .zero)
        let image = UIImage(systemName: "x.circle.fill")
        view.setImage(image, for: .normal)
        view.tintColor = .gray
        view.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    @objc func tapCheckButton(){
        tapCallback()
    }
    
    @objc func deleteTask(){
        deleteTaskCallback(title.text ?? "")
    }
    
    
}

extension TaskCell: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(backView)
        backView.addSubview(check)
        backView.addSubview(icon)
        backView.addSubview(date)
        backView.addSubview(deleteButton)
        backView.addSubview(title)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            check.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 30),
            check.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            deleteButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -10),
            deleteButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            
            icon.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -30),
            icon.topAnchor.constraint(equalTo: backView.topAnchor,constant: 15),
            icon.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.4),
            
            date.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            date.topAnchor.constraint(equalTo: icon.bottomAnchor,constant: 5),
            
            title.leadingAnchor.constraint(equalTo: check.trailingAnchor,constant: 5),
            title.trailingAnchor.constraint(equalTo: icon.leadingAnchor, constant: -5),
            title.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        backView.applyShaddow(cornerRadius: 10, opacity: 0.5)
        isUserInteractionEnabled = true        
    }
}

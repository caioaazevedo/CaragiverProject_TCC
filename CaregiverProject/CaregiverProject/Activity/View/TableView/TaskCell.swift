//
//  TaskCell.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit

class TaskCell: UITableViewCell{
    //    lazy var checkbox:
    
    var tapCallback: () -> () = { }
    
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
    
    
}

extension TaskCell: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(check)
        addSubview(title)
        addSubview(icon)
        addSubview(date)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            check.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            check.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            title.leadingAnchor.constraint(equalTo: check.trailingAnchor,constant: 5),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            icon.trailingAnchor.constraint(equalTo: trailingAnchor),
            icon.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor,constant: 10),
            icon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            date.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            date.topAnchor.constraint(equalTo: icon.bottomAnchor,constant: 5),
        ])
    }
    
    func setUpAditionalConficuration() {
        layer.borderWidth = 2
        layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        layer.cornerRadius = 20
        isUserInteractionEnabled = true        
    }
}

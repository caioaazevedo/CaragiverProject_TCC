//
//  CreateTaskCell.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 07/04/21.
//

import UIKit

class CreateTaskCell: UITableViewCell{
        
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}

extension CreateTaskCell: ViewCodeProtocol{
    func setUpViewHierarchy() {
        addSubview(title)
        addSubview(icon)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            icon.trailingAnchor.constraint(equalTo: trailingAnchor),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
        ])
    }
}


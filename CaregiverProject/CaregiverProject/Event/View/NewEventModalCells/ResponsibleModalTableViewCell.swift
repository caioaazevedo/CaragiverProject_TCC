//
//  ResponsibleModalTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 28/04/21.
//

import UIKit

class ResponsibleModalTableViewCell: UITableViewCell {

    static let identifier = "ResponsibleModalCellID"
    
    private var imageSize: CGFloat {
        return 30
    }
    
    lazy var responsibleImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "profileIcon")
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = imageSize/2
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var responsibleName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Name"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUp() {
        setUpView()
    }
}

extension ResponsibleModalTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(responsibleImage)
        contentView.addSubview(responsibleName)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            responsibleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            responsibleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            responsibleImage.heightAnchor.constraint(equalToConstant: imageSize),
            responsibleImage.widthAnchor.constraint(equalToConstant: imageSize),
            
            responsibleName.centerYAnchor.constraint(equalTo: centerYAnchor),
            responsibleName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            responsibleName.trailingAnchor.constraint(equalTo: responsibleImage.leadingAnchor, constant: -10)
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        selectionStyle = .none
    }
}

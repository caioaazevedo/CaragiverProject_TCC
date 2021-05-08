//
//  EventCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 05/04/21.
//

import UIKit

class EventCell: UITableViewCell {
    
    static let identifier = "EventCellID"
    
    private enum Layout {
        static var imageSize: CGFloat = 50.0
        static var categorySize: CGFloat = 20.0
    }
    
    lazy var backView = buildBackView()
    lazy var personImage = buildPersonImage()
    lazy var personName = buildPersonName()
    lazy var title = buildTitleLabel()
    lazy var categoryColor = buildCategoryColor()
    lazy var scheduleTime = buildScheduleTime()
    
    func setUp() {
        setUpView()
    } 
}

extension EventCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(backView)
        backView.addSubview(personImage)
        backView.addSubview(personName)
        backView.addSubview(scheduleTime)
        backView.addSubview(categoryColor)
        backView.addSubview(title)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            personImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            personImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            personImage.widthAnchor.constraint(equalToConstant: Layout.imageSize),
            personImage.heightAnchor.constraint(equalToConstant: Layout.imageSize),
            
            personName.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 10),
            personName.centerXAnchor.constraint(equalTo: personImage.centerXAnchor),
            
            scheduleTime.centerYAnchor.constraint(equalTo: personName.centerYAnchor),
            scheduleTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),

            categoryColor.centerYAnchor.constraint(equalTo: personImage.centerYAnchor),
            categoryColor.centerXAnchor.constraint(equalTo: scheduleTime.centerXAnchor),
            categoryColor.widthAnchor.constraint(equalToConstant: Layout.categorySize),
            categoryColor.heightAnchor.constraint(equalToConstant: Layout.categorySize),
            
            title.centerYAnchor.constraint(equalTo: personImage.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 30),
            title.trailingAnchor.constraint(equalTo: categoryColor.leadingAnchor, constant: -10)
        ])
    }
    
    func setUpAditionalConficuration() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}

extension EventCell {
    
    private func buildBackView() -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.applyShaddow(cornerRadius: 10, opacity: 0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    private func buildPersonImage() -> UIImageView {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "profileIcon")
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = Layout.imageSize/2
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    private func buildPersonName() -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = "Name"
        let font = UIFont.preferredFont(forTextStyle: .footnote)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildTitleLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = "Title of the Event"
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildScheduleTime() -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = "Title of the Event"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func buildCategoryColor() -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.layer.cornerRadius = Layout.categorySize/2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

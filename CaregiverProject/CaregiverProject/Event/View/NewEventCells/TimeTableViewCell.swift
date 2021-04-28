//
//  TimeTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

protocol TimeTableViewCellDelegate: class {
    func didChangeTime(time: String)
}

class TimeTableViewCell: UITableViewCell {

    private weak var delegate: TimeTableViewCellDelegate?
    
    static let identifier = "TimeCellID"
    
    private let icon: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "clock.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Time"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .time
        view.preferredDatePickerStyle = .inline
        view.setDate(Date().addingTimeInterval(3600), animated: false)
        view.addTarget(self, action: #selector(timeDidChange), for: .valueChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUp(delegate: TimeTableViewCellDelegate) {
        self.delegate = delegate
        setUpView()
    }
}

//MARK:- Actions
extension TimeTableViewCell {
    @objc func timeDidChange(_ picker: UIDatePicker) {
        delegate?.didChangeTime(time: picker.date.getFormattedDate())
    }
}

extension TimeTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timePicker)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),

            timePicker.centerYAnchor.constraint(equalTo: centerYAnchor),
            timePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            timePicker.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setUpAditionalConficuration() {
        selectionStyle = .none
        backgroundColor = .white
    }
}


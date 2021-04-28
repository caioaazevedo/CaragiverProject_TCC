//
//  NotesTableViewCell.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    static let identifier = "NotesCellID"
    
    private let icon: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "note.text", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Notes"
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var notes: UITextView = {
        let textView = UITextView()
        textView.insertText("Write some notes...")
        textView.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        textView.indicatorStyle = .default
        textView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func setUp(delegate: UITextViewDelegate) {
        notes.delegate = delegate
        setUpView()
    }
}

extension NotesTableViewCell: ViewCodeProtocol {
    func setUpViewHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(titleLabel)
        contentView.addSubview(notes)
    }

    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),

            titleLabel.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),

            notes.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 5),
            notes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            notes.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            notes.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setUpAditionalConficuration() {
        selectionStyle = .none
        backgroundColor = .white
    }
}


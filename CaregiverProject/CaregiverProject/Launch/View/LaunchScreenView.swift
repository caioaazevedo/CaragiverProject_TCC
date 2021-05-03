//
//  LaunchScreenView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 03/05/21.
//

import UIKit

class LaunchScreenView: UIView{
    
    lazy var dismiss: (() -> ()) = {}
    
    lazy var icon: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "launchImage")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.text = "I Care"
        view.textColor = .black
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LaunchScreenView: ViewCodeProtocol{
    
    func setUpViewHierarchy() {
        addSubview(icon)
        addSubview(title)
    }
    
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -20),
            icon.widthAnchor.constraint(equalToConstant: Metrics.Device.width*0.5),
            icon.heightAnchor.constraint(equalToConstant: Metrics.Device.height*0.3),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: icon.bottomAnchor),
        ])
    }
    
    func setUpAditionalConficuration() {
        backgroundColor = .white
        icon.alpha = 0
        title.alpha = 0
        
        UIView.animate(withDuration: 1, animations: { [self] in
            icon.alpha = 1
            title.alpha = 1
        },completion: { [self] _ in
            UIView.animate(withDuration: 0.3,delay: 0.6, animations: {
                icon.alpha = 0
                title.alpha = 0
            },completion: { _ in
                self.dismiss()
            })
        }
        )
    }
    
}

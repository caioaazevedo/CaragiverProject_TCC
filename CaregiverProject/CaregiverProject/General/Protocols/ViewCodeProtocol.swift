//
//  ViewCodeProtocol.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import Foundation

protocol ViewCodeProtocol {
    func setUpView()
    func setUpViewHierarchy()
    func setUpViewConstraints()
    func setUpAditionalConficuration()
}

extension ViewCodeProtocol {
    func setUpView() {
        setUpViewHierarchy()
        setUpViewConstraints()
        setUpAditionalConficuration()
    }
    
    func setUpAditionalConficuration() {}
}

//
//  FamilyManageView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

final class FamilyManageView: UIView{
    
    var familyNameFld: UITextField = {
        var text = UITextField(frame: .zero)
        text.placeholder = "Family's name"
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var createFamilyBtn: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Family", for: .normal)
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FamilyManageView: ViewCodeProtocol{
    func setUpViewHierarchy() {
        self.addSubview(familyNameFld)
        self.addSubview(createFamilyBtn)
    }
    
    func setUpViewConstraints() {}
    
    func setUpAditionalConficuration() {}
    
    
}

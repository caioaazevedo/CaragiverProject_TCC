//
//  MainButton.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 09/05/21.
//

import UIKit

enum CustomButtonType {
    case primary, secondary, tertiary, cancel
    
    var color: UIColor {
        switch self {
        case .primary:
            return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        case .secondary:
            return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case .tertiary:
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .cancel:
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
}

class CustomButton: UIButton {
    
    private var color: UIColor
    
    init(type: CustomButtonType) {
        self.color = type.color
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        contentEdgeInsets = .init(top: 8, left: 14, bottom: 8, right: 14)
        backgroundColor = color
        applyShaddow(cornerRadius: 8)
    }
}

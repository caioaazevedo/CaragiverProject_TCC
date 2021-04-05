//
//  UIView+Extension.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit

extension UIView {
    func applyShaddow(cornerRadius: CGFloat = 20.0, opacity: Float = 0.5) {
        self.layer.shadowColor = .init(gray: 0.0, alpha: 0.5)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
    }
}

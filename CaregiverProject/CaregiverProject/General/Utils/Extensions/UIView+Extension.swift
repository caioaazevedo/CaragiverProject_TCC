//
//  UIView+Extension.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit

extension UIView {
    func applyShaddow(cornerRadius: CGFloat = 10.0, opacity: Float = 0.5, offset: CGSize = CGSize(width: 0.0, height: 5.0), radius: CGFloat? = nil) {
        self.layer.shadowColor = .init(gray: 0.0, alpha: 0.5)
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius ?? cornerRadius
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
    }
}

//
//  Metrics.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

enum Metrics {
    static let spacing = CGFloat(8)
    
    enum Device{
        static var height: CGFloat{
            return UIScreen.main.bounds.height
        }
        static var width: CGFloat{
            return UIScreen.main.bounds.width
        }
    }
    
    enum FontSize{
        static let title = CGFloat(32)
        static let body = CGFloat(20)
    }
    
    enum TableRow{
        static let `default` = CGFloat(44)
    }
}

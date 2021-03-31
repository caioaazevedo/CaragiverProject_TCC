//
//  CustomViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 31/03/21.
//

import UIKit

open class CustomViewController<ContentView: UIView>: UIViewController {
    public var contentView = ContentView()
    
    open override func loadView() {
        view = contentView
    }
}

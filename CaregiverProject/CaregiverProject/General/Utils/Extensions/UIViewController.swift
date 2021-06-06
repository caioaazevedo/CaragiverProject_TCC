//
//  UIViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 27/03/21.
//

import UIKit

extension UIViewController {
    fileprivate var tag: Int { 9999 }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let spinnerView = UIView(frame: .zero)
            spinnerView.translatesAutoresizingMaskIntoConstraints = false
            spinnerView.tag = self.tag
            spinnerView.backgroundColor = UIColor(white: 0, alpha: 0.7)
            
            let spinner = UIActivityIndicatorView(style: .large)
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.startAnimating()
            spinner.color = .white
            
            spinnerView.addSubview(spinner)
            self.view.addSubview(spinnerView)
            
            NSLayoutConstraint.activate([
                spinnerView.topAnchor.constraint(equalTo: self.view.topAnchor),
                spinnerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                spinnerView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                spinnerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                
                spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ])
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            for view in self.view.subviews {
                if view.tag == self.tag {
                    view.removeFromSuperview()
                }
            }
        }
    }
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func showOkAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}

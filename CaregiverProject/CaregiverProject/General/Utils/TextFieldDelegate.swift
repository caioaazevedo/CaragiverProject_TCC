//
//  TextFieldDelegate.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 21/04/21.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

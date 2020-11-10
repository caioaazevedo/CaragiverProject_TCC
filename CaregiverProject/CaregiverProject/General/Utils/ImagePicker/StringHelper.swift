//
//  StringHelper.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 10/11/20.
//

import Foundation

enum StringHelper {
    
    enum imagePickerOptions {
        case camera, library
        
        var title: String {
            switch self {
            case .camera:
                return "Open the Camera"
            case .library:
                return "Open the Photo Library"
            }
        }
    }
}

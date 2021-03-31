//
//  ImageDecoder.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import UIKit

extension String {
    func decodedImage() -> UIImage? {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: data)
    }
}

extension UIImage {
    func encode() -> String {
        let imageData = jpegData(compressionQuality: 0.5)
        let str64 = imageData?.base64EncodedString(options: .lineLength64Characters)
        return str64 ?? ""
    }
}

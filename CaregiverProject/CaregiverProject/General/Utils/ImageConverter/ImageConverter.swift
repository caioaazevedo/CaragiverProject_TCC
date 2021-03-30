//
//  DecodeImage.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 30/03/21.
//

import UIKit

struct ImageConverter {
    func encodeImage(image: UIImage?) -> String {
        //Now use image to create into NSData format
        guard let image = image else { return "" }
        let imageData = image.jpegData(compressionQuality: 0.5)
        let str64 = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        return str64 ?? ""
    }
    
    func decodeImage(str64: String?) -> UIImage? {
        guard let str64 = str64 else { return nil }
        
        let dataDecoded : Data = Data(base64Encoded: str64, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        return decodedimage
    }
}

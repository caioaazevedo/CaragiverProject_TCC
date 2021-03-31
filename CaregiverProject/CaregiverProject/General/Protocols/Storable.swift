//
//  Storageable.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation

protocol Storable {
    var id: String { get set }
    init(id: String, dictionary: [String: Any])
    func convertToDictionary() -> [String: Any]
}

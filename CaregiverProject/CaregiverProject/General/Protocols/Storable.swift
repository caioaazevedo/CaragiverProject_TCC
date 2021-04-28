//
//  Storageable.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 31/03/21.
//

import Foundation

protocol Storable {
    static var queryValue: String { get }
    var id: String { get set }
    init(id: String, dictionary: NSDictionary)
    func convertToDictionary() -> [String: Any]
}

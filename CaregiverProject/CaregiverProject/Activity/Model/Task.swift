//
//  Task.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit
import Foundation

typealias Tasks = [Task]

struct Task {
    var name: String
    var date: String
    var icon: UIImage
    var isCompleted: Bool
}

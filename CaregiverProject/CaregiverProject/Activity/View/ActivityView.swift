//
//  ActivityView.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 05/04/21.
//

import UIKit
import Foundation

final class ActivityView: UIView{
    lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Adicionar Tarefa", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

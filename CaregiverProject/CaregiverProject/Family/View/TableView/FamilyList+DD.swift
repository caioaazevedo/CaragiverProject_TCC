//
//  FamilyList+DataSource.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import UIKit

extension FamilyListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension FamilyListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

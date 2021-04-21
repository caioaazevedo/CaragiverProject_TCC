//
//  ProfileDataSource.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 21/04/21.
//

import UIKit

class ProfileDataSource: NSObject {
    private var profileInfo = [String: String]()
    private var profileInfoTitles: [String] {
        profileInfo.keys.map { $0 }
    }
    private let profileUpdater: ProfileUpdating
    private let textFieldDelegate = TextFieldDelegate()
    
    init(profileUpdater: ProfileUpdating) {
        self.profileUpdater = profileUpdater
    }
    
    func update(profileInfo: [String: String]) {
        self.profileInfo = profileInfo
    }
}

extension ProfileDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileInfoTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoCell.identifier) as? ProfileInfoCell else {
            fatalError("Didn't register cell")
        }
        let info = profileInfoTitles[indexPath.row]
        cell.setUpView()
        cell.delegate = profileUpdater
        cell.info = info
        cell.infoTextField.text = profileInfo[info]
        cell.infoTextField.delegate = textFieldDelegate
        return cell
    }
}

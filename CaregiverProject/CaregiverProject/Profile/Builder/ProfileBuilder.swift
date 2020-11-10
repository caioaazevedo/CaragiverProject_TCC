//
//  ProfileBuilder.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import Firebase

final class ProfileBuilder{
    class func buildProfileModule() -> ProfileViewController{
        let interactor = ProfileInteractor(database: Database.database())
        let familyViewController = ProfileViewController(presenter: ProfilePresenter(with: interactor))
        return familyViewController
    }
}

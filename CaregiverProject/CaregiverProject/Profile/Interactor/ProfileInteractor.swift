//
//  ProfileInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 10/11/20.
//

import UIKit
import Firebase

protocol ProfileInteractorLogic{
    var ref: DatabaseReference? {get}
    func addValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ())
    func readValue(_ dataID: String,completion: @escaping ([String]) -> ())
    func updateValue(_ entity: ModelProtocol,completion: @escaping (Bool) -> ())
    func deleteValue(_ dataID: String,completion: @escaping (Bool) -> ())
}

class ProfileInteractor: ProfileInteractorLogic{
    
    internal let ref: DatabaseReference?
    
    init(database: Database){
        self.ref = database.reference()
    }
    
    func addValue(_ entity: ModelProtocol, completion: @escaping (Bool) -> ()) {}
    func readValue(_ dataID: String, completion: @escaping ([String]) -> ()) {}
    func updateValue(_ entity: ModelProtocol, completion: @escaping (Bool) -> ()) {}
    func deleteValue(_ dataID: String, completion: @escaping (Bool) -> ()) {}    
}

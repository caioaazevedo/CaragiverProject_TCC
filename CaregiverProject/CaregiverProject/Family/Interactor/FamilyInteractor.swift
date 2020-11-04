//
//  FamilyInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

protocol FamilyInteractorProtocol{
    func addMember(_ member: Member, completion: (Bool) -> ())
    func readMember(_ member: Member, completion: (Member) -> ())
    func updateMember(_ member: Member, completion: (Member) -> ())
    func removeMember(_ memberID: UUID, completion: (Bool) -> ())
}

class FamilyInteractor:  FamilyInteractorProtocol{
    
    func addMember(_ member: Member, completion: (Bool) -> ()) {}
    
    func readMember(_ member: Member, completion: (Member) -> ()) {}
    
    func updateMember(_ member: Member, completion: (Member) -> ()) {}
    
    func removeMember(_ memberID: UUID, completion: (Bool) -> ()) {}
    

}

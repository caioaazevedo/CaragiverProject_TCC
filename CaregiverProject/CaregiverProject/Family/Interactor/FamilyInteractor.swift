//
//  FamilyInteractor.swift
//  CaregiverProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 04/11/20.
//

import Foundation

typealias FamilyInteractorProtocol = FamilyManagementLogic & MemberManagementLogic

protocol FamilyManagementLogic{
      func addFamily(_ member: Family, completion: (Bool) -> ())
      func readFamily(_ familyID: UUID, completion: (Family) -> ())
      func updateFamily(_ member: Family, completion: (Bool) -> ())
      func removefamily(_ memberID: UUID, completion: (Bool) -> ())
}

protocol MemberManagementLogic{
    func addMember(_ member: Member, completion: (Bool) -> ())
    func readMember(_ memberID: UUID, completion: (Member) -> ())
    func updateMember(_ member: Member, completion: (Bool) -> ())
    func removeMember(_ memberID: UUID, completion: (Bool) -> ())
}


class FamilyInteractor:  FamilyInteractorProtocol{    
    func addFamily(_ member: Family, completion: (Bool) -> ()) {}
    func readFamily(_ familyID: UUID, completion: (Family) -> ()) {}
    func updateFamily(_ member: Family, completion: (Bool) -> ()) {}
    func removefamily(_ memberID: UUID, completion: (Bool) -> ()) {}
    
    func addMember(_ member: Member, completion: (Bool) -> ()) {}
    func readMember(_ memberID: UUID, completion: (Member) -> ()) {}
    func updateMember(_ member: Member, completion: (Bool) -> ()) {}
    func removeMember(_ memberID: UUID, completion: (Bool) -> ()) {}
}

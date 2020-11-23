//
//  FamilyTreeViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit
import Combine

class FamilyTreeViewController: UIViewController {
    var presenter: FamilyPresenter?
    var familyId: String?
    var subscriber: AnyCancellable?
    
    lazy var sectionDict: [Int:(header: String, members: [Member])] = {
        var dict = [Int:(header: String, members: [Member])]()
        dict[MemberType.husband_wife.type] = (header: "Husband/Wife", members: [Member]())
        dict[MemberType.son_daughter.type] = (header: "Son/Daugther", members: [Member]())
        dict[MemberType.grandson_granddaughter.type] = (header: "Grandson/Granddaughter", members: [Member]())
        dict[MemberType.others.type] = (header: "Others", members: [Member]())
        return dict
    }()

    var presentedView: ViewCodeProtocol?{
        willSet{
            if let view = newValue as? UIView{
                self.view = view
            }
        }
    }

    override func viewDidLoad() {
        getFamily()
    }
   
    func getFamily(){
        guard let presenter = presenter else {return}
        guard let id = familyId else {return}
        
        let family = Family(id: id, name: "", members: [])
        
        presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Any.self, operation: .read) { [weak self] (result) in
            guard let self = self else {return}
            guard let familyEntity = result as? Family else {return}
            
            for id in familyEntity.members{
                let member = Member(id: id, name: "", email: "", password: "", memberType: .grandson_granddaughter, image: nil, isAdmin: false)
                
                presenter.manageEntity(entity: member, entityType: .Member, intendedReturn: Any.self, operation: .read) { [weak self] (result) in
                    guard let self = self else {return}
                    guard let memberEntity = result as? Member else {return}
                    guard self.sectionDict[memberEntity.memberType.type] != nil else {return}
                    self.sectionDict[memberEntity.memberType.type]!.members.append(memberEntity)
                    
                    guard let view = self.presentedView as? FamilyTreeView else {return}
                    view.collectionView.reloadData()
                }
            }
            
        }
    }
    
    
    func assignSubscriber(publisher: AnyPublisher<ProfileEntity,Never>){        
        self.subscriber = publisher
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] profile in
                guard let `self` = self,let view = self.view as? FamilyTreeView else {return}                
                view.elderName.text = profile.name
                view.elderImage.image = profile.photo
            }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppUtility.lockOrientation(.all)
    }
}

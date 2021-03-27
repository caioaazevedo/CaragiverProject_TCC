//
//  FamilyTreeViewController.swift
//  CaregiverProject
//
//  Created by Fábio Maciel de Sousa on 10/11/20.
//

import UIKit
import Combine

class FamilyTreeViewController: UIViewController {
    let presenter: FamilyPresenter
    var familyId: String?
    let familyTreeView: FamilyTreeView
    var subscriber: AnyCancellable?
    var callRefresh: (() ->())?
    
    init(presenter: FamilyPresenter,
         familyTreeView: FamilyTreeView) {
        self.presenter = presenter
        self.familyTreeView = familyTreeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = familyTreeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppUtility.lockOrientation(.portrait)
        self.callRefresh?()
        getFamily()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        AppUtility.lockOrientation(.all)
    }
    
    func getFamily(){
        guard let id = familyId else { return }
        let family = Family(id: id, name: "", members: [])
        presenter.manageEntity(entity: family, entityType: .Family, intendedReturn: Any.self, operation: .read) { [weak self] (result) in
            guard let self = self else {return}
            guard let familyEntity = result as? Family else {return}
            
            for id in familyEntity.members{
                let member = Member(id: id, name: "", email: "", password: "", memberType: .grandson_granddaughter, image: nil, isAdmin: false)
                
                self.presenter.manageEntity(entity: member, entityType: .Member, intendedReturn: Any.self, operation: .read) { [weak self] (result) in
                    
                   
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
}

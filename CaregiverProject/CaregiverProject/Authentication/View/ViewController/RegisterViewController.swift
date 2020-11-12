//
//  RegisterViewController.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 02/11/20.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerView = RegisterView()
    var presenter: ViewToPresenterRegisterProtocol?
    
    var selectedRelationship: String?
    var relationshipList = [MemberType.husband_wife.title,
                            MemberType.son_daughter.title,
                            MemberType.grandson_granddaughter.title,
                            MemberType.others.title]
    
    var imageManager: ImagePickerManager?
    
    override func loadView() {
        super.loadView()
        
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageManager = ImagePickerManager(viewController: self, delegate: self)
        registerView.imageButton.addTarget(self, action: #selector(presentPicker), for: .touchUpInside)
        registerView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        createPickerView()
        dismissPickerView()
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        registerView.memberRelationship.inputView = pickerView
    }
    
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        registerView.memberRelationship.inputAccessoryView = toolBar
    }
    
    func getMemberType(typeString: String?) -> MemberType {
        switch typeString {
        case MemberType.husband_wife.title:
            return MemberType.husband_wife
        case MemberType.son_daughter.title:
            return MemberType.son_daughter
        case MemberType.grandson_granddaughter.title:
            return MemberType.grandson_granddaughter
        case MemberType.others.title:
            return MemberType.others
        default:
            return MemberType.others
        }
    }
    
    @objc func presentPicker() {
        imageManager?.present()
    }
    
    @objc func register() {
        let name = registerView.realName.text!
        let email = registerView.username.text!
        let password = registerView.password.text!
        let memberType = registerView.memberRelationship.text
        let member = Member(id: "", name: name, email: email, password: password, memberType: getMemberType(typeString: memberType), image: registerView.imageView.image)
        presenter?.registerUser(member: member)
    }
    
    @objc func action() {
          view.endEditing(true)
    }

}

extension RegisterViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        registerView.imageView.image = image
    }
}

extension RegisterViewController: PresenterToViewRegisterProtocol {
    func registerSucceded(){
        let viewController = StartFamilyViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func showError(errorMsg: String) {
        self.registerView.feedBackLabel.text = errorMsg
    }
}

extension RegisterViewController: UITextFieldDelegate {

}

extension RegisterViewController: UIPickerViewDelegate {
    
}

extension RegisterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return relationshipList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return relationshipList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRelationship = relationshipList[row]
        registerView.memberRelationship.text = selectedRelationship
    }
}

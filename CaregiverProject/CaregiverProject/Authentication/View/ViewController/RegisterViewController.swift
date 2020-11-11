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
        registerView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        createPickerView()
        dismissPickerView()
    }
    
    @objc func register() {
        let name = registerView.realName.text!
        let email = registerView.username.text!
        let password = registerView.password.text!
        let member = Member(name: name, email: email, password: password, type: MemberType.husband_wife)
        presenter?.registerUser(member: member)
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

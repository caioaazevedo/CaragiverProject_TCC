//
//  ImagePickerManager.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 10/11/20.
//

import UIKit

protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?)
}

class ImagePickerManager: NSObject {
    
    //MARK:- Properties
    private let pickerController: UIImagePickerController
    private weak var viewController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    //MARK:- Initializer
    init(viewController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        super.init()
        self.viewController = viewController
        self.delegate = delegate
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    
    //MARK:- Methods
    
    
    /// Method to create a UIAlertView to chose between picker controller sorce type
    /// - Parameters:
    ///   - type: Source Type from Picker Controller to use by the picker
    ///   - title: the title of the alert based on picker source type
    /// - Returns: A UIAlertView to select the prefered source type
    private func sourceTypeAction(type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        
        return UIAlertAction(title: title, style: .default) { [unowned self] (_) in
            self.pickerController.sourceType = type
            self.viewController?.present(self.pickerController, animated: true)
        }
    }
    
    /// Method to presenrt the alert action with the optiions based on UIImagePickerController SourceType
    public func present() {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if let action = self.sourceTypeAction(type: .camera, title: StringHelper.imagePickerOptions.camera.title) {
                alertController.addAction(action)
            }
        if let action = self.sourceTypeAction(type: .photoLibrary, title: StringHelper.imagePickerOptions.library.title) {
                alertController.addAction(action)
            }

            alertController.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

            self.viewController?.present(alertController, animated: true)
        }
    
    /// Get the selected image from the pickerControler and calls the didSelect Method from delegate and dismiss the viewController
    /// - Parameters:
    ///   - controller: The imagePickerController
    ///   - image: the image selected
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)

        guard  let img = image else { return }
        self.delegate?.didSelect(image: img)
    }
    
}

//MARK:- Picker Delegate
extension ImagePickerManager: UIImagePickerControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.pickerController(picker, didSelect: nil)
        }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePickerManager: UINavigationControllerDelegate{ }

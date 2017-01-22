//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Noam Rubin on 12/15/16.
//  Copyright © 2016 Noam Rubin. All rights reserved.
//

import UIKit

class MealViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: properties
    @IBOutlet weak var theTextInput: UITextField!
    @IBOutlet weak var imageWuddup: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!

    
    /* I think you're really cute - viv */
    override func viewDidLoad() {
        super.viewDidLoad()
        theTextInput.delegate = self
    }

    //MARK: UITextViewDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageWuddup.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: actions
    @IBAction func pickinDaImage(_ sender: UITapGestureRecognizer) {
        theTextInput.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary // .photoLibrary is abbreviated because imagePickerController.sourceType is an enum.
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

}


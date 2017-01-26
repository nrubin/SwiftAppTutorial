//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Noam Rubin on 12/15/16.
//  Copyright © 2016 Noam Rubin. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: properties
    @IBOutlet weak var theTextInput: UITextField!
    @IBOutlet weak var imageWuddup: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    // this is a new meal
    var meal: Meal?

    
    
    /* I think you're really cute - viv */
    override func viewDidLoad() {
        super.viewDidLoad()
        theTextInput.delegate = self
        
        //enable the save button only if the user entered a valid name
        updateSaveButtonState()
    }

    //MARK: UITextViewDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //disable the save button while editing
        saveButton.isEnabled = false;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
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
    
    //MARK: navigation
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = theTextInput.text ?? ""
        let photo = imageWuddup.image
        let rating = ratingControl.rating
        meal = Meal(name:name, photo:photo, rating:rating)
    }
    
    //MARK: actions
    @IBAction func pickinDaImage(_ sender: UITapGestureRecognizer) {
        theTextInput.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary // .photoLibrary is abbreviated because imagePickerController.sourceType is an enum.
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: Private methods
    private func updateSaveButtonState() {
        //Disable the save button if the text field is empty
        let text = theTextInput.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}


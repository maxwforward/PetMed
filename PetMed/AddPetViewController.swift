//############################################################################################################################################################
//  AddPetViewController.swift
//  PetMed
//
//  Created by mwforwar on 3/11/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import UIKit


//============================================================================================================================================================
// Add Pet View Controller
//============================================================================================================================================================
// AddPetViewController is a subclass of UIViewController
// Adopts the following protocols:
// UIImagePickerControllerDelegate - A set of methods that your delegate object must implement to interact with the image picker interface
// UINavigationControllerDelegate - modify behavior when a view controller is pushed or popped from the navigation stack of a UINavigationController object.
class AddPetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // Create outlets for the UI components of this view
    @IBOutlet weak var petNameTextField: UITextField!
    @IBOutlet weak var petAgeTextField: UITextField!
    @IBOutlet weak var animalTypeOrBreedTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var medicationTableView: UITableView!
    @IBOutlet weak var petGenderSegmentedControl: UISegmentedControl!
    
    // Create outlet for the image of the pet
    @IBOutlet weak var petImage: UIImageView!
    
    // Create a variable to store a string containing pet gender
    var petGender = "Male" // our segmented control is set to Male by default
    
    // Create a variable to store whether or not the user saved a new entry
    var savedEntry = false
    
    // Create a variable to store the image data
    var petUploadImageData: Data?
    
    // Define a variable to store the added pet object
    var addedPet: Pet = Pet(name: "", breed: "", age: "", gender: "", weight: "", medication: ["" : ""], imageData: nil)

    // Create an Image Picker Controller to handle picking images
    let imagePicker = UIImagePickerController()
    
    
    //********************************************************************************************************************************************************
    // This function defines the action of the "Upload/Take Image" Button
    //********************************************************************************************************************************************************
    @IBAction func setImage(_ sender: Any)
    {
        // Set delegate of Image Picker Controller to self
        imagePicker.delegate = self
        
        // Create an alert controller
        let uploadImageAlert = UIAlertController(title: "Upload Image", message: "Please select a source for uploading an image", preferredStyle: .alert)
        
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        // Create and define action of the "Photo Library" button on the alert controller
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default)
        {
            (action) in
            
            // Don't allow the user to edit the selected image
            self.imagePicker.allowsEditing = false
            
            // Set the source type of the image picker to the photo library
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            // Present the image picker
            self.present(self.imagePicker, animated: true)
        }
        
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        // Create and define action of the "Camera" button on the alert controller
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        let cameraAction = UIAlertAction(title: "Camera", style: .default)
        {
            (action) in
            
            // If camera is available...
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                // Don't allow the user to edit the selected image
                self.imagePicker.allowsEditing = false
                
                // Set the source type of the image picker to the camera
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                
                // Enter camera capture mode and take up the full screen
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.modalPresentationStyle = .fullScreen
                
                // Present the image picker after taking a photo
                self.present(self.imagePicker, animated: true)
            }
            // If camera is not available...
            else
            {
                // Print an error statement
                print("ERROR: No Camera Available")
            }
        }
        
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        // Create and define action of the "Cancel" button on the alert controller
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        {
            (action) in
        }
        
        // Add "Photo Library", "Camera", and "Cancel" buttons to the alert controller
        uploadImageAlert.addAction(photoLibraryAction)
        uploadImageAlert.addAction(cameraAction)
        uploadImageAlert.addAction(cancelAction)
        
        // Present the alert controller when the "Upload/Take Image" button is tapped
        self.present(uploadImageAlert, animated: true, completion: nil)
    }
    
    
    //********************************************************************************************************************************************************
    // This function is called when the user picks an image
    //********************************************************************************************************************************************************
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        // If the user is able to pick a picture
        if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            // Set the imageview to the picked image
            petImage.image = picture
            
            // Save the image data for the picked image
            petUploadImageData = UIImagePNGRepresentation(self.petImage.image!)
        }
        // If the user is unable to pick a picture
        else
        {
            // Display error message
            print("ERROR: Could not display image")
        }
        
        // Dismiss the picker view after picking an image
        self.dismiss(animated: true, completion: nil)
    }
        
    
    //********************************************************************************************************************************************************
    // This function defines the action of the segmented control being changed
    //********************************************************************************************************************************************************
    @IBAction func petGenderChanged(_ sender: Any)
    {
        // Switch case depending on which segment is selected from the segmented control
        switch petGenderSegmentedControl.selectedSegmentIndex
        {
        // If Male is selected
        case 0:
            petGender = "Male"
            
        // If Female is selected
        case 1:
            petGender = "Female"
            
        // Default case
        default:
            break
        }
    }
    
    
    //********************************************************************************************************************************************************
    // This function defines the action of the "Save" button
    //********************************************************************************************************************************************************
    @IBAction func saveButton(_ sender: Any)
    {
        // Save data from textfields
        let petName = petNameTextField.text
        let petBreed = animalTypeOrBreedTextField.text
        let petAge = petAgeTextField.text
        let petWeight = weightTextField.text
        
        // create a new pet object with the data and save it
        self.addedPet = Pet(name: petName!, breed: petBreed!, age: petAge!, gender: petGender, weight: petWeight!, medication: ["" : ""], imageData: petUploadImageData)
        
        // Set the flag to true after saving an entry
        savedEntry = true
    }
    
    
    //********************************************************************************************************************************************************
    // This function performs any additional setup after loading the view
    //********************************************************************************************************************************************************
    override func viewDidLoad()
    {
        // Load the view
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //********************************************************************************************************************************************************
    // This is a default function for memory usage
    //********************************************************************************************************************************************************
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

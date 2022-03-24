//############################################################################################################################################################
//  DetailViewController.swift
//  PetMed
//
//  Created by mwforwar on 4/15/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import Foundation
import UIKit


//============================================================================================================================================================
// Detail View Controller
//============================================================================================================================================================
// DetailViewController is a subclass of UIViewController
class DetailViewController: UIViewController
{
    // Outlets for labels
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petGenderLabel: UILabel!
    @IBOutlet weak var petBreedSpeciesLabel: UILabel!
    @IBOutlet weak var petAgeLabel: UILabel!
    @IBOutlet weak var petWeightLabel: UILabel!
    
    // Create oulet for pet image
    @IBOutlet weak var detailPetImage: UIImageView!
    
    // Create a variable to store the pet object recieved from the segue
    var detailPet: Pet?
    
    
    //********************************************************************************************************************************************************
    // This function performs any additional setup after loading the view
    //********************************************************************************************************************************************************
    override func viewDidLoad()
    {
        // Load The view
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set all the labels to the corresponding values from the Pet object that was passed to this view controller
        petNameLabel.text = detailPet?.petName
        petGenderLabel.text = detailPet?.petGender
        petBreedSpeciesLabel.text = detailPet?.petBreed
        petAgeLabel.text = (detailPet?.petAge)! + " years old"
        petWeightLabel.text = (detailPet?.petWeightInPounds)! + " pounds"
        
        // Set the image to the image data corresponding to the pet passed into the controller
        detailPetImage.image = UIImage(data: (detailPet?.petImageData)!)
    }
}

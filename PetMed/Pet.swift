//############################################################################################################################################################
//  Pet.swift
//  PetMed
//
//  Created by mwforwar on 3/11/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import Foundation


//============================================================================================================================================================
// Pet object class
//============================================================================================================================================================
class Pet
{
    // Define variables for a Pet object
    var petName: String?
    var petBreed: String?
    var petAge: String?
    var petGender: String?
    var petWeightInPounds: String?
    var petMedicationDictionary: [String: String] = [:]
    var petImageData: Data?
    
    
    //********************************************************************************************************************************************************
    // Initialization function
    //********************************************************************************************************************************************************
    init(name: String, breed: String, age: String, gender: String, weight: String, medication: [String: String], imageData: Data?)
    {
        // Use input parameters to set variables
        petName = name
        petBreed = breed
        petAge = age
        petGender = gender
        petWeightInPounds = weight
        petMedicationDictionary = medication
        petImageData = imageData
    }
}

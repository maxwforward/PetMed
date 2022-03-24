//############################################################################################################################################################
//  PetMedList.swift
//  PetMed
//
//  Created by mwforwar on 3/11/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import Foundation


//============================================================================================================================================================
// PetMedList object class
//============================================================================================================================================================
class PetMedList
{
    // Create an array of Pet objects
    var petListArray: [Pet] = []
    
    
    //********************************************************************************************************************************************************
    // This function returns the number of Pet objects in the PetMedList
    //********************************************************************************************************************************************************
    func getNumberOfPets() -> Int // returns an Integer
    {
        // Count the number of elements in petListArray and return the number
        return petListArray.count
    }
    
    
    //********************************************************************************************************************************************************
    // This function gets the pet name at a specified index
    //********************************************************************************************************************************************************
    func getNameOfPetAt(index: Int) -> String // returns a String
    {
        // Return the name of the Pet object at "index"
        return petListArray[index].petName!
    }
    
    
    //********************************************************************************************************************************************************
    // This function gets the pet image data at a specified index
    //********************************************************************************************************************************************************
    func getImageOfPetAt(index: Int) -> Data // returns Data
    {
        // Return the image data of the Pet object at "index"
        return petListArray[index].petImageData!
    }
    
    
    //********************************************************************************************************************************************************
    // This function adds a Pet
    //********************************************************************************************************************************************************
    func addPetToList(newPet: Pet)
    {
        // Append the new pet to the array
        petListArray.append(newPet)
    }
    
    
    //********************************************************************************************************************************************************
    // This function gets the pet object at a specified index
    //********************************************************************************************************************************************************
    func getPetAt(index: Int) -> Pet // returns a Pet object
    {
        // Return the Pet object at "index"
        return petListArray[index]
    }
}
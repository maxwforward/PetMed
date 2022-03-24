//############################################################################################################################################################
//  MainViewController.swift
//  PetMed
//
//  Created by mwforwar on 3/11/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import UIKit


//============================================================================================================================================================
// Main View Controller Class
//============================================================================================================================================================
// MainViewController is a subclass of UIViewController
// Adopts the following protocols:
// UITableViewDelegate - Delegate of UITableView object must adopt this protocol
// UITableViewDataSource - This protocol is adopted by an object that mediates the application's data model for a UITableView object
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    // Outlet for Table View named "PetTable"
    @IBOutlet weak var PetTable: UITableView!
    
    // Initialize a PetMedList object named "myPetMedList"
    var myPetMedList: PetMedList = PetMedList() // "myPetMedList" contains an array of Pet objects
    
    
    //********************************************************************************************************************************************************
    // This function tells the data source to return the number of rows in a given section of a table view
    //********************************************************************************************************************************************************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Return number of Pet objects in "myPetMedList"
        return myPetMedList.getNumberOfPets()
    }
    
    
    //********************************************************************************************************************************************************
    // This function creates the table view cells.  It will be called for each cell seperately
    //********************************************************************************************************************************************************
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Create a cell for the table view
        let cell = PetTable.dequeueReusableCell(withIdentifier: "petCell", for: indexPath) as! PetTableViewCell // Make the cells PetTableViewCell objects
        
        // Set text of label inside cell to the corresponding pet name from the petMedList
        cell.petCellLabel.text = myPetMedList.getNameOfPetAt(index: indexPath.row)
        
        // Set image for imageView inside cell to the corresponding image data from the pet array
        cell.petCellImage.image = UIImage(data: myPetMedList.getImageOfPetAt(index: indexPath.row))
        
        // Return the cell
        return cell
    }
    
    
    //********************************************************************************************************************************************************
    // This function implements an unwind segue from AddPetViewController to this view controller when the "<" button is tapped
    //********************************************************************************************************************************************************
    @IBAction func UnwindFromAddPetVC(segue: UIStoryboardSegue)
    {
        // If the unwind is coming from the AddPetViewController
        if let sourceViewController = segue.source as? AddPetViewController
        {
            // If an entry was saved...
            if (sourceViewController.savedEntry == true)
            {
                // Add the new pet from AddPetViewController to the list
                myPetMedList.addPetToList(newPet: sourceViewController.addedPet)
            }
            // If an entry was not saved...
            else
            {
                // Do Nothing except go back to this view controller
            }
        }
        
        // Update the table view
        self.PetTable.reloadData()
    }
    
    
    //********************************************************************************************************************************************************
    // This function implements an unwind segue from the SearchMapViewController to this view controller when the "<" button is tapped
    //********************************************************************************************************************************************************
    @IBAction func UnwindFromSearchMapVC(segue: UIStoryboardSegue)
    {
        // Do Nothing except go back to this view controller
    }
    
    
    //********************************************************************************************************************************************************
    // This function segues to the DetailViewController
    //********************************************************************************************************************************************************
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // If the segue we are using is called "toPetDetailView"...
        if(segue.identifier == "toPetDetailView")
        {
            // Save the IndexPath of the selected cell
            let selectedIndex: IndexPath = self.PetTable.indexPath(for: sender as! UITableViewCell)!
        
            // Save the pet object from the selected cell
            let selectedPet: Pet = myPetMedList.getPetAt(index: selectedIndex.row)
        
            // Set the destination of this segue as DetailViewController and save it in "des"
            let des = segue.destination as! DetailViewController
        
            // Pass "selectedPet" through the segue and save as "detailPet" within DetailViewController ("des")
            des.detailPet = selectedPet
        }
    }
    
    
    //********************************************************************************************************************************************************
    // This function implements an unwind segue from the DetailViewController to this view controller when the "<" button is tapped
    //********************************************************************************************************************************************************
    @IBAction func UnwindFromDetailVC(segue: UIStoryboardSegue)
    {
        // Do Nothing except go back to this view controller
    }
    
    
    //********************************************************************************************************************************************************
    // This function performs any additional setup after loading the view
    //********************************************************************************************************************************************************
    override func viewDidLoad()
    {
        // Load The view
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

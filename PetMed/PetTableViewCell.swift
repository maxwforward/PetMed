//############################################################################################################################################################
//  PetTableViewCell.swift
//  PetMed
//
//  Created by mwforwar on 3/11/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import Foundation
import UIKit


//============================================================================================================================================================
// PetTableViewCell object class
//============================================================================================================================================================
// PetTableViewCell is a child of UITableViewCell which is a cell in a table view
class PetTableViewCell: UITableViewCell
{
    // Create outlets for the UI components of the cell
    @IBOutlet weak var petCellLabel: UILabel! // label containing pet name within the cell
    @IBOutlet weak var petCellImage: UIImageView! // image inside the cell
    
    
    //********************************************************************************************************************************************************
    // Prepares the reciever for service after it has been loaded from an interface Builder archive, or nib file
    //********************************************************************************************************************************************************
    override func awakeFromNib()
    {
        // Initialization code
        super.awakeFromNib()
    }
    
    
    //********************************************************************************************************************************************************
    // Sets the selected state of the cell, optionally animating the transition betweeen states
    //********************************************************************************************************************************************************
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        // Configure the view for the selected state
        super.setSelected(selected, animated: animated)
    }
}

//
//  PetCoreData+CoreDataProperties.swift
//  PetMed
//
//  Created by mwforwar on 4/15/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//
//

import Foundation
import CoreData


extension PetCoreData
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetCoreData>
    {
        return NSFetchRequest<PetCoreData>(entityName: "PetCoreData")
    }

    @NSManaged public var petImage: NSData?
    @NSManaged public var petName: String?
    @NSManaged public var petAge: String?
    @NSManaged public var petBreed: String?
    @NSManaged public var petGender: String?
    @NSManaged public var petWeight: String?
    @NSManaged public var petMedication: String?
    @NSManaged public var petPersciption: String?

}

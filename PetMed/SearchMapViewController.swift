//############################################################################################################################################################
//  SearchMapViewController.swift
//  PetMed
//
//  Created by mwforwar on 4/15/19.
//  Copyright © 2019 Max Forward. All rights reserved.
//############################################################################################################################################################

// Imports
import Foundation
import UIKit
import MapKit
import CoreLocation


//============================================================================================================================================================
// Search Map View Controller
//============================================================================================================================================================
// SearchMapViewController is a subclass of UIViewController
// Adopts the following protocols:
// CLLocationManagerDelegate - The methods that you use to receive events from an associated location manager object
class SearchMapViewController: UIViewController, CLLocationManagerDelegate
{
    // Create an outlet for the map on screen
    @IBOutlet weak var searchMap: MKMapView!
    
    // Create a CLLocationManager object
    let manager = CLLocationManager()
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        /*let userLocation = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        searchMap.setRegion(region, animated: true)
        self.searchMap.showsUserLocation = true*/
        
        let localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = "veterinarian"
        localSearchRequest.region = searchMap.region
        let localSearch = MKLocalSearch(request: localSearchRequest)
        
        localSearch.start
        {
            response, _ in
            guard let response = response
            else
            {
                return
            }
                
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
                
            for i in 1...matchingItems.count-1
            {
                let placeOfIntrest = matchingItems[i].placemark
                let ani = MKPointAnnotation()
                ani.coordinate = placeOfIntrest.location!.coordinate
                ani.title = placeOfIntrest.name
                ani.subtitle = placeOfIntrest.subLocality
                self.searchMap.addAnnotation(ani)
            }
        }
    }
    
    
    
    //********************************************************************************************************************************************************
    // This function performs any additional setup after loading the view
    //********************************************************************************************************************************************************
    override func viewDidLoad()
    {
        // Load The view
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //----------------------------------------------------------------------------------------------------------------------------------------------------
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //----------------------------------------------------------------------------------------------------------------------------------------------------
    }
}

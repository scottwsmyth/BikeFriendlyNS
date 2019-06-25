//
//  MapViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-13.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, JSONParserProtocol {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var feedItems: NSArray = NSArray()
    var selectedLocation : Company = Company()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for i in 0 ..< feedItems.count{
            
            var temp: Company = Company()
            
            temp = feedItems[i] as! Company
            
            //print(temp.title)
        }
        
          addAnnotations()
          checkLocationServices()
          zoomInOnUserLocation()
    }
    
    func itemsDownloaded(items: NSArray) {

        feedItems = items
    }
    
    //Function sets each annotations title and coordinates. First creates an empty MKPointAnnotation, then sets the properties
    
    func addAnnotations(){
        
        for i in 0 ..< feedItems.count {
            let annotation = MKPointAnnotation()
            
            var temp: Company = Company()
            
            temp = feedItems[i] as! Company
            
            annotation.title = temp.title
            
            var dLati = 0.0
            var dLongi = 0.0
            let latitude: String? = temp.latitude
            let longitude: String? = temp.longitude
            
            if let strLat = latitude {
                dLati = Double(strLat)!
            }
            
            if let strLong = longitude{
                dLongi = Double(strLong)! as! Double
            }
            
                annotation.coordinate = CLLocationCoordinate2D(latitude: dLati, longitude: dLongi)// doubleLat is of type Double now
            
            
            
            mapView.addAnnotation(annotation)
        }
    }
    
    //Setting the locationmanager delegate as self and the accuracy to the nearest ten meters
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            // Set up our location manager
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            // Show an alert letting the user know they have to turn location services on
            
            let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //Function to check the users authorization status on their phone
    
    func checkLocationAuthorization(){
        
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            //If authorized when in use then set the user location to true
            mapView.showsUserLocation = true
            locationManager.startUpdatingHeading()
            break
        case .denied:
            //Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            print()
        }
        
    }
    
    //Function zooms in on the users location with a frame of 100000 x 100000 meters
    
    func zoomInOnUserLocation() {
        
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 300000, longitudinalMeters: 300000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    //Function for adding an info button/image on each annotation
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        
        if annotation is MKUserLocation { return nil }
    
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "CustomAnnotation")
        
            if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")}
        
            //Conditionals to set the annotation image
        
            if      annotation.title == "The New Glasgow Town Hall" ||
                    annotation.title == "Hants Exhibition Grounds" ||
                    annotation.title == "BernArt" ||
                    annotation.title == "Cathedral Church of All Saints" ||
                    annotation.title == "Berwick and District Library"{
                    annotationView?.image = UIImage(named: "Attraction")
            }
            else if annotation.title == "Holiday Inn Truro" ||
                    annotation.title == "Best Western Plus"{
                    annotationView?.image = UIImage(named: "Building")
            }
            else if annotation.title == "Mercator Vineyards" ||
                    annotation.title == "Meander River Brewery" ||
                    annotation.title == "Breton Brewery" ||
                    annotation.title == "Good Robot Brewery" ||
                    annotation.title == "Tanner and Co. Brewing" ||
                    annotation.title == "Annapolis Valley Cider" ||
                    annotation.title == "Garrison Brewery" ||
                    annotation.title == "Duncans Pub" ||
                    annotation.title == "The Union Street Cafe" ||
                    annotation.title == "The Dancing Goat Café and Bakery" ||
                    annotation.title == "Pavia Espresso Bar and Cafe"{
                    annotationView?.image = UIImage(named: "Resturant")
            }
            else if annotation.title == "Halifax Cycles and Guitars" ||
                    annotation.title == "Velofix NS" ||
                    annotation.title == "Train Station Bike and Bean" ||
                    annotation.title == "Sportwheels Sports Excellence" ||
                    annotation.title == "Cyclesmith" ||
                    annotation.title == "Velo Baie Sainte-Marie" ||
                    annotation.title == "The Bicycle Specialist" ||
                    annotation.title == "Frameworks Cycles and Fitness" ||
                    annotation.title == "Idealbikes"{
                    annotationView?.image = UIImage(named: "Bike")
            }
            else if annotation.title == "Queens Place Emera Centre" ||
                    annotation.title == "Wiles Lake Farmers Market" ||
                    annotation.title == "Cloud Nine Novelties" ||
                    annotation.title == "Bay Ferry Ltd “Fundy Rose”" ||
                    annotation.title == "Jeff’s Old Volkswagon Home"{
                    annotationView?.image = UIImage(named: "Flag")
            }
            else if annotation.title == "OceanStone Seaside Resort" ||
                    annotation.title == "River Ridge Lodge" ||
                    annotation.title == "Garden House B&B" ||
                    annotation.title == "Kaulbach House" ||
                    annotation.title == "Harbour Guesthouse" ||
                    annotation.title == "Lane’s Privateer Inn" ||
                    annotation.title == "The Scotsman Inn" ||
                    annotation.title == "The Maven Gypsy B&B and Cottages" ||
                    annotation.title == "The Burlington Rose"{
                    annotationView?.image = UIImage(named: "House")
            }
            else if annotation.title == "Bear River Millyard and Recreation" ||
                    annotation.title == "Lacey Mines Campground"{
                    annotationView?.image = UIImage(named: "Camping")
            }
            else if annotation.title == "Earltown General Store" ||
                    annotation.title == "Snow White Laundry and Convenience"{
                    annotationView?.image = UIImage(named: "Grocery.png")
            }
        
            let btn = UIButton(type: .detailDisclosure) as UIButton
            annotationView?.rightCalloutAccessoryView = btn
        
            annotationView?.canShowCallout = true
            return annotationView
    
        }
    
    
    //Function that fires when the info button is pressed on a specific annotation
    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//
//        for i in ..<feedItems.count {
//
//            if i["title"] as? String == view.annotation?.title{
//
//                //Find the current annotation in points array grab the description and image
//
//                let vc = storyboard?.instantiateViewController(withIdentifier: "LocationDetailController") as? LocationDetailController
//
//                //Setting the LocationDetailController properties
//
//                vc?.passedImg = i["img"] as! UIImage
//                vc?.passedDescription = i["des"] as! String
//                vc?.passedTitle = i["title"] as! String
//                vc?.passedDescription2 = i["des2"] as! String
//                vc?.passedURL = i["URL"] as! String
//
//                //Push the LocationDetailController on the stack
//
//                self.navigationController?.pushViewController(vc!, animated: true)
//
//            }
//        }
//    }
}


//Extending map view controller in order to implement CLLocation delegate methods

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 300000, longitudinalMeters: 300000)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Whenever the authorization changes
        checkLocationAuthorization()
    }
    
}

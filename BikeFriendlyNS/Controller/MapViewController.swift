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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var feedItems: NSArray = NSArray()
    var selectedLocation : Company = Company()
    var globalAnnotationArray: [MKAnnotation] = []
    var placeMark: CLPlacemark?
    
    //Titles for the dropdown menus' cells
    var filterList = ["All", "Attraction", "Bike Shop", "Camping", "Flag", "House", "Inn", "Restaurant"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          //Setting dropdown menu properties (just rounded button and clear color for cells)
          filterBtn.layer.cornerRadius = 10
          filterBtn.clipsToBounds = true
          tableView.isHidden = true
          tableView.backgroundColor = UIColor.clear
        
          addAnnotations()
          zoomInOnUserLocation()
          checkLocationServices()
        
          //Populate global array
          globalAnnotationArray = mapView.annotations
        
    }
    
    func itemsDownloaded(items: NSArray) {

        print("FEEDITEMS")
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
            
            //If lets are converting the JSONS' latitude and longitude strings to doubles
            if let strLat = latitude {
                dLati = Double(strLat)! as! Double
            }
            
            if let strLong = longitude{
                dLongi = Double(strLong)! as! Double
            }
            
            //Add latitude and longitude to current annotation
            annotation.coordinate = CLLocationCoordinate2D(latitude: dLati, longitude: dLongi)// doubleLat is of type Double now
                
            //Add annotation to map
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

        var temp: Company = Company()
        
        if annotation is MKUserLocation { return nil }
    
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "CustomAnnotation")
        
            if annotationView == nil {

            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")

            }
    
                //Loop to apply images to each annotation
        
                for i in 0 ..< feedItems.count{
                    
                temp = feedItems[i] as! Company
                
                    if annotation.title == temp.title{
                        annotationView?.image = UIImage(named: temp.typeOfService!)
                    }
                }
    
            let btn = UIButton(type: .detailDisclosure) as UIButton
            annotationView?.rightCalloutAccessoryView = btn
        
            annotationView?.canShowCallout = true
            return annotationView
    
        }
    
    
    //Function that fires when the info button is pressed on a specific annotation
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        for i in 0 ..< feedItems.count {
            
            var temp: Company = Company()
            
            temp = feedItems[i] as! Company
            
            if temp.title == view.annotation?.title{
                
                //Find the current annotation in points array grab the description and image

                let vc = storyboard?.instantiateViewController(withIdentifier: "LocationDetailViewController") as? LocationDetailViewController

                //Setting the LocationDetailController properties
                
                  vc?.passedImg = UIImage(named: temp.imagePath!)!
                  vc?.passedTitle = temp.title as! String
                  vc?.passedDescription = temp.descrip as! String
                  vc?.passedAddress = temp.address as! String
                  vc?.passedPhone = temp.phone as! String
                  vc?.passedURL = temp.url as! String

                //Push the LocationDetailController on the stack

                self.navigationController?.pushViewController(vc!, animated: true)

            }
        }
    }
    
    func animate (toggle: Bool){
        if toggle{
            UIView.animate(withDuration: 0.5){
                self.tableView.isHidden = false
            }
        }
        else{
            UIView.animate(withDuration: 0.5){
                self.tableView.isHidden = true
            }
        }
    }
    
    func filter(selectedType: String){
        
        for i in 0 ..< feedItems.count {
    
            //grabbing the current feedItem and setting it to currentFeed, also setting currentAnnotation to be a temp.
            var currentFeed: Company = Company()
            currentFeed = feedItems[i] as! Company
            var currentAnnotation = MKPointAnnotation()
            
            //If the user selects all the case is simple, we just add every annotation from the global array into the mapview
            if selectedType == "All"
            {
                //Check the mapviews annotation array to see if it contains the feedItem, if not then make an annotation object with the currentFeed's info and add it to the mapview
                var contained = false
                
                for j in 0 ..< mapView.annotations.count{
                    
                    if mapView.annotations[j].title == currentFeed.title
                    {
                        contained = true
                        break
                    }
                    
                }
                
                //If contained is false after checking the whole mapviews annotation array, then proceed to create
                if contained == false {
            
                    currentAnnotation.title = currentFeed.title
                    
                    var dLati = 0.0
                    var dLongi = 0.0
                    let latitude: String? = currentFeed.latitude
                    let longitude: String? = currentFeed.longitude
                    
                    //If lets are converting the JSONS' latitude and longitude strings to doubles
                    if let strLat = latitude {
                        dLati = Double(strLat)! as! Double
                    }
                    
                    if let strLong = longitude{
                        dLongi = Double(strLong)! as! Double
                    }
                    
                    //Add latitude and longitude to current annotation
                    currentAnnotation.coordinate = CLLocationCoordinate2D(latitude: dLati, longitude: dLongi)// doubleLat is of type Double now
                    
                    //Add annotation to map
                    
                    print(currentAnnotation.title)
                    
                    mapView.addAnnotation(currentAnnotation)
                    
                    print("added annotation")
                    
                }
            }

            //Run through the feedItems array and check to see if the currentFeed's type of service != the selected type from the user
            if currentFeed.typeOfService != selectedType && selectedType != "All"
            {
        
                //Loop through the current mapviews annotations, if it is the user's location skip, if the mapviews annotations array has an annotation = currentFeed then we remove it.
                for j in 0 ..< mapView.annotations.count{
                    
                    var skip = false
                    
                    if mapView.annotations[j] is MKUserLocation {
                        skip = true
                    }
                    
                    if skip != true
                    {
                    
                    currentAnnotation = (mapView.annotations[j] as? MKPointAnnotation)!
                    
                    if currentAnnotation.title == currentFeed.title{
                        mapView.removeAnnotation(currentAnnotation)
                        break
                    }
                    
                    }
                }
            }
            
            //If the user selects a type that is equal to the current feed (opposite scenario) we need to add these annotations to the map if they are NOT already there.
            if currentFeed.typeOfService == selectedType{
                
                print(currentFeed.typeOfService)
                print(selectedType)
                
                //Check the mapviews annotation array to see if it contains the feedItem, if not then make an annotation object with the currentFeed's info and add it to the mapview
                var contained = false
                
                for j in 0 ..< mapView.annotations.count{
                    
                    if mapView.annotations[j].title == currentFeed.title
                    {
                        contained = true
                        break
                    }
                    
                }
                
                //If contained is false after checking the whole mapviews annotation array, then proceed to create
                if contained == false {
                    
                    currentAnnotation.title = currentFeed.title
                    
                    var dLati = 0.0
                    var dLongi = 0.0
                    let latitude: String? = currentFeed.latitude
                    let longitude: String? = currentFeed.longitude
                    
                    //If lets are converting the JSONS' latitude and longitude strings to doubles
                    if let strLat = latitude {
                        dLati = Double(strLat)! as! Double
                    }
                    
                    if let strLong = longitude{
                        dLongi = Double(strLong)! as! Double
                    }
                    
                    //Add latitude and longitude to current annotation
                    currentAnnotation.coordinate = CLLocationCoordinate2D(latitude: dLati, longitude: dLongi)// doubleLat is of type Double now
                    
                    //Add annotation to map
                    mapView.addAnnotation(currentAnnotation)
                    

                }
                
            }
        }
    }

    
    @IBAction func feedbackBtnPressed(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") as? FeedbackViewController

        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {

        if tableView.isHidden == true{
            animate(toggle: true)
        }
        else{
            animate(toggle: false)
        }
    }
    
    @IBAction func directionBtnPressed(_ sender: UIButton) {
        guard let currentPlaceMark = placeMark else{
            return
        }
        
        var directionRequest = MKDirections.Request()
        let destinationPlacemark = MKPlacemark(placemark: currentPlaceMark)
        directionRequest.source = MKMapItem.forCurrentLocation()
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile
        
        // calculate the directions / route
        let directions = MKDirections(request: directionRequest)
        directions.calculate {(directionsResponse, error) in
            guard let directionsResponse = directionsResponse else{
                if let error = error{
                    print("error getting directions: \(error.localizedDescription)")
                }
                return
            }
            
            let route = directionsResponse.routes
        }
    }
    
}

//Extending map view controller in order to implement CLLocation delegate methods

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 300000, longitudinalMeters: 300000)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.placeMark = MKPlacemark(coordinate: view.annotation!.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Whenever the authorization changes
        checkLocationAuthorization()
    }
    
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filterList[indexPath.row]
        cell.contentView.backgroundColor = UIColor.clear
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedType = filterList[indexPath.row]
        
        filter(selectedType: selectedType)
        
        filterBtn.setTitle(selectedType, for: .normal)
        
        animate(toggle: false)
    }
    
    
}

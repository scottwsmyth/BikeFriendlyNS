//
//  Company.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-24.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class Company: NSObject {

    //properties
    
    var title: String?
    var latitude: String?
    var longitude: String?
    var facebookURL: String?
    var descrip: String?
    var phone: String?
    var address: String?
    var imagePath: String?
    var typeOfService: String?
    
    override init(){
        
    }
    
    init(title: String, latitude: String,longitude: String, facebookURL: String, descrip: String, phone: String, address: String, imagePath: String, typeOfService: String){
        
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.facebookURL = facebookURL
        self.descrip = descrip
        self.phone = phone
        self.address = address
        self.imagePath = imagePath
        self.typeOfService = typeOfService
    }
    
    
    
}

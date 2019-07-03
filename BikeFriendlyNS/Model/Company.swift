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
    var descrip: String?
    var phone: String?
    var address: String?
    var imagePath: String?
    var typeOfService: String?
    var facebookURL: String?
    var instagramURL: String?
    var twitterURL: String?
    var websiteURL: String?
    
    override init(){
        
    }
    
    init(title: String, latitude: String,longitude: String, descrip: String, phone: String, address: String, imagePath: String, typeOfService: String, facebookURL: String, instagramURL: String, twitterURL: String, websiteURL:String){
        
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
        self.descrip = descrip
        self.phone = phone
        self.address = address
        self.imagePath = imagePath
        self.typeOfService = typeOfService
        self.facebookURL = facebookURL
        self.instagramURL = instagramURL
        self.twitterURL = twitterURL
        self.websiteURL = websiteURL
    }
    
    
    
}

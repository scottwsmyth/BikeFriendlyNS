//
//  JSONParser.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-25.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

protocol JSONParserProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class JSONParser: NSObject, URLSessionDataDelegate {

    weak var delegate: JSONParserProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://scottwsmyth.com/service.php"
    
    func downloadItems(){
        
        let url: URL = URL(string: urlPath)!
        
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
                print("Failed to download data")
            }
            else{
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
    
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = Company()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let title = jsonElement["title"],
                  let latitude = jsonElement["latitude"],
                  let longitude = jsonElement["longitude"],
                  let url = jsonElement["url"],
                  let descrip = jsonElement["descrip"],
                  let phone = jsonElement["phone"],
                  let address = jsonElement["address"],
                  let imagePath = jsonElement["imagePath"],
                  let typeOfService = jsonElement["typeOfService"]
            {
                
                  location.title = title as? String
                
                  location.latitude = latitude as? String
                
                  location.longitude = longitude as? String
                
                  location.url = url as? String
                
                  location.descrip = descrip as? String
                
                  location.phone = phone as? String
                
                  location.address = address as? String
                
                  location.imagePath = imagePath as? String
                
                  location.typeOfService = typeOfService as? String
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
    
}

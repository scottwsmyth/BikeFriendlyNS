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
            if let title = jsonElement["title"] as? String,
                let latitude = jsonElement["latitude"] as? Float,
                let longitude = jsonElement["longitude"] as? Float,
                let url = jsonElement["url"] as? String,
                let descrip = jsonElement["descrip"] as? String,
                let phone = jsonElement["phone"] as? String,
                let address = jsonElement["address"] as? String,
                let imagePath = jsonElement["imagePath"] as? String
            {
                
                location.title = title
                location.latitude = latitude
                location.longitude = longitude
                location.url = url
                location.descrip = descrip
                location.phone = phone
                location.address = address
                location.imagePath = imagePath
                
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
    
}

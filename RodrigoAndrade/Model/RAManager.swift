//
//  ProfileManager.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/18/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class RAManager: NSObject {

    func requestProfile() -> Profile {
        let plistPath: String = Bundle.main.path(forResource: "Profile", ofType:"plist")!
        let plistDict = NSDictionary(contentsOfFile:plistPath)
        
        // Location
        let locationInDataSet = plistDict?.object(forKey: "location") as! NSDictionary
        let location = Location(name: locationInDataSet.object(forKey: "name") as! String,
                                latitude: locationInDataSet.object(forKey: "latitude") as! Double,
                                longitude: locationInDataSet.object(forKey: "longitude") as! Double)
        
        // Profile
        let profile = Profile(avatar: UIImage(named:plistDict?.object(forKey: "avatar") as! String),
                              avatarWatch: plistDict?.object(forKey: "avatarWatch") as! String,
                              name: plistDict?.object(forKey: "name") as! String,
                              job: plistDict?.object(forKey: "job") as! String,
                              location: location, skills: Skills(plistDict: plistDict?.object(forKey: "skills") as! NSDictionary))
        return profile
    }
    
}

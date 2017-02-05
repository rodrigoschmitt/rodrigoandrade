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
        
        // Profile
        let profile = Profile()
        profile.avatar = UIImage(named:plistDict?.object(forKey: "avatar") as! String)
        profile.avatarWatch = plistDict?.object(forKey: "avatarWatch") as! String
        profile.name = plistDict?.object(forKey: "name") as! String
        profile.job = plistDict?.object(forKey: "job") as! String
        
        // Location
        let location = Location()
        location.name = (plistDict?.object(forKey: "location") as AnyObject).object(forKey: "name") as! String
        location.latitude = (plistDict?.object(forKey: "location") as AnyObject).object(forKey: "latitude") as! Double
        location.longitude = (plistDict?.object(forKey: "location") as AnyObject).object(forKey: "longitude") as! Double
        
        profile.location = location
        
        // Skills
        profile.skills = Skills(plistDict: plistDict?.object(forKey: "skills") as! NSDictionary);
        
        return profile
    }
   
}

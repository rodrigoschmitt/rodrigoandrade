//
//  ProfileManager.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/18/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit

class RAManager: NSObject {

    func requestProfile() -> Profile {
        
        let plistPath: String = NSBundle.mainBundle().pathForResource("Profile", ofType:"plist")!
        let plistDict = NSDictionary(contentsOfFile:plistPath)
        
        // Profile
        let profile = Profile()
        profile.avatar = UIImage(named:plistDict?.objectForKey("avatar") as! String)
        profile.avatarWatch = plistDict?.objectForKey("avatarWatch") as! String
        profile.name = plistDict?.objectForKey("name") as! String
        profile.job = plistDict?.objectForKey("job") as! String
        
        // Location
        let location = Location()
        location.name = plistDict?.objectForKey("location")?.objectForKey("name") as! String
        location.latitude = plistDict?.objectForKey("location")?.objectForKey("latitude") as! Double
        location.longitude = plistDict?.objectForKey("location")?.objectForKey("longitude") as! Double
        
        profile.location = location
        
        // Skills
        profile.skills = Skills(plistDict: plistDict?.objectForKey("skills") as! NSDictionary);
        
        return profile
    }
   
}

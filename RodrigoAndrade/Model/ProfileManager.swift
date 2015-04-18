//
//  ProfileManager.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/18/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit

class ProfileManager: NSObject {

    func requestProfile() -> Profile {
        
        let plistPath: String = NSBundle.mainBundle().pathForResource("Profile", ofType:"plist")!
        let plistDict = NSDictionary(contentsOfFile:plistPath)
        
        let profile = Profile()
        profile.avatar = UIImage(named:plistDict?.objectForKey("avatar") as! String)
        profile.name = plistDict?.objectForKey("name") as! String
        profile.job = plistDict?.objectForKey("job") as! String
        profile.locationName = plistDict?.objectForKey("location")?.objectForKey("name") as! String
        
        return profile
    }
   
}

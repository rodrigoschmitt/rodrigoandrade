//
//  Skill.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/19/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit

class Skill: NSObject {
    
    let plistDict: NSDictionary!
    init(plistDict: NSDictionary) {
        
        self.plistDict = plistDict
        
    }
    
    var photo: UIImage!
    
    var name: String {
        get {
            return self.plistDict.objectForKey("name") as! String
        }
    }
    
    var title: String {
        get {
            return self.plistDict.objectForKey("title") as! String
        }
    }
    
    var detail: String {
        get {
            return self.plistDict.objectForKey("detail") as! String
        }
    }
    
    var period: String {
        get {
            return self.plistDict.objectForKey("period") as! String
        }
    }
    
    var since: String {
        get {
            return self.plistDict.objectForKey("since") as! String
        }
    }
    
    var link: String {
        get {
            return self.plistDict.objectForKey("link") as! String
        }
    }
   
}

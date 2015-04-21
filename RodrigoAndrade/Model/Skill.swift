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
    
    var photo: UIImage {
        get {
            return UIImage(named:self.plistDict.objectForKey("photo") as! String)!
        }
    }
    
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
    
    var since: NSDate {
        get {
            return self.plistDict.objectForKey("since") as! NSDate
        }
    }
    
    var period: String? {
        get {
            if self.plistDict.objectForKey("period") != nil {
                return self.plistDict.objectForKey("period") as? String
            }
            
            return nil
        }
    }
    
    var link: String {
        get {
            return self.plistDict.objectForKey("link") as! String
        }
    }
    
    var linkButton: String? {
        get {
            if self.plistDict.objectForKey("linkButton") != nil {
                return self.plistDict.objectForKey("linkButton") as? String
            }
            
            return nil
        }
    }
   
}

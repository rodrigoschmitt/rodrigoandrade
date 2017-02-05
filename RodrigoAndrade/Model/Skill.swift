//
//  Skill.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/19/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class Skill: NSObject {
    
    let plistDict: NSDictionary!
    init(plistDict: NSDictionary) {
        
        self.plistDict = plistDict
        
    }
    
    var photo: UIImage {
        get {
            return UIImage(named:self.plistDict.object(forKey: "photo") as! String)!
        }
    }
    
    var photoName: String {
        get {
            return self.plistDict.object(forKey: "photo") as! String
        }
    }
    
    var name: String {
        get {
            return self.plistDict.object(forKey: "name") as! String
        }
    }
    
    var title: String {
        get {
            return self.plistDict.object(forKey: "title") as! String
        }
    }
    
    var detail: String {
        get {
            return self.plistDict.object(forKey: "detail") as! String
        }
    }
    
    var since: Date {
        get {
            return self.plistDict.object(forKey: "since") as! Date
        }
    }
    
    var period: String? {
        get {
            if self.plistDict.object(forKey: "period") != nil {
                return self.plistDict.object(forKey: "period") as? String
            }
            
            return nil
        }
    }
    
    var link: String {
        get {
            return self.plistDict.object(forKey: "link") as! String
        }
    }
    
    var linkButton: String? {
        get {
            if self.plistDict.object(forKey: "linkButton") != nil {
                return self.plistDict.object(forKey: "linkButton") as? String
            }
            
            return nil
        }
    }
   
}

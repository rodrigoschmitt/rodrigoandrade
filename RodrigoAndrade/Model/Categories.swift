//
//  Categories.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/19/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class Categories: NSObject {
    
    let plistArray: NSArray!
    init(plistArray: NSArray, name: String) {
        
        self.name = name;
        self.plistArray = plistArray
        
    }
    
    var name: String!
    
    var skills: NSArray {
        get {
            let skills: NSMutableArray = []
            
            for item in self.plistArray {
                
                let skill = Skill(plistDict: item as! NSDictionary)
                skills.addObject(skill)
                
            }
            
            return skills
        }
    }

   
}

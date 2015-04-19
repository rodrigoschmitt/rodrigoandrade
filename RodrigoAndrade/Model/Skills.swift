//
//  Skills.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/18/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit

class Skills: NSObject {
    
    let plistDict: NSDictionary!
    init(plistDict: NSDictionary) {
        
        self.plistDict = plistDict
        
    }
    
    var categories: NSArray {
        get {
            let categories: NSMutableArray = []
            
            for itens in self.plistDict {
                
                let cat = Categories(plistArray: itens.value as! NSArray, name: itens.key as! String)
                categories.addObject(cat)
            }
            
            return categories
        }
    }
   
}

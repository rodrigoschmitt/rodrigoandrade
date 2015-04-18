//
//  Util.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/18/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    func circularProfile(imgProfile: UIImageView, borderWith: CGFloat) {
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.clipsToBounds = true
        imgProfile.layer.borderWidth = borderWith
        imgProfile.layer.borderColor = UIColor.whiteColor().CGColor
        
    }
    
}

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
    
    func calculateAge (birthday: NSDate) -> NSString {
        
        var userAge : NSInteger = 0
        var calendar : NSCalendar = NSCalendar.currentCalendar()
        var unitFlags : NSCalendarUnit = NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay
        var dateComponentNow : NSDateComponents = calendar.components(unitFlags, fromDate: NSDate())
        var dateComponentBirth : NSDateComponents = calendar.components(unitFlags, fromDate: birthday)
        
        
        var resultYear = dateComponentNow.year - dateComponentBirth.year
        var resultMonth = dateComponentNow.month - dateComponentBirth.month
        var resultDay = dateComponentNow.day - dateComponentBirth.day
        
        if (resultYear < 1) {
            if (resultMonth == 0) {
                if (resultDay <= 1) {
                    return "\(resultDay) day"
                }
                else {
                    return "\(resultDay) days"
                }
            }
            else {
                if (resultMonth <= 1) {
                    return "\(resultMonth) month"
                }
                else {
                    return "\(resultMonth) months"
                }
            }
        } else {
            if (resultYear == 1) {
                return "\(resultYear) year"
            } else {
                return "\(resultYear) years"   
            }
        }
    
    }
    
    func takeSnapshot(view: UIView) -> UIImage {
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
}

//
//  Util.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/18/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    func circularProfile(_ imgProfile: UIImageView, borderWith: CGFloat) {
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.clipsToBounds = true
        imgProfile.layer.borderWidth = borderWith
        imgProfile.layer.borderColor = UIColor.white.cgColor
    }
    
    func calculateAge (_ birthday: Date) -> NSString {
        let calendar = NSCalendar.current
        let unitFlags = Set<Calendar.Component>([.day, .month, .year, .hour])
        let dateComponentNow = calendar.dateComponents(unitFlags, from: Date())
        let dateComponentBirth = calendar.dateComponents(unitFlags, from: birthday)
        
        let resultYear = dateComponentNow.year! - dateComponentBirth.year!
        let resultMonth = dateComponentNow.month! - dateComponentBirth.month!
        let resultDay = dateComponentNow.day! - dateComponentBirth.day!
        
        if resultYear < 1 {
            if resultMonth == 0 {
                if (resultDay <= 1) {
                    return "\(resultDay) day" as NSString
                }
                else {
                    return "\(resultDay) days" as NSString
                }
            }
            else {
                if resultMonth <= 1 {
                    return "\(resultMonth) month" as NSString
                }
                else {
                    return "\(resultMonth) months" as NSString
                }
            }
        } else {
            if resultYear == 1 {
                return "\(resultYear) year" as NSString
            } else {
                return "\(resultYear) years" as NSString   
            }
        }
    }
    
    func formatDate (_ originalDate: Date) -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMMM dd, yyyy"
        
        let dateString = dayTimePeriodFormatter.string(from: originalDate)
        
        return dateString
    }
    
    func takeSnapshot(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}

//
//  DetailInterfaceController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/26/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import WatchKit
import Foundation

class DetailInterfaceController: WKInterfaceController {

    @IBOutlet weak var imgSkill: WKInterfaceImage!
    @IBOutlet weak var lblName: WKInterfaceLabel!
    @IBOutlet weak var lblTitle: WKInterfaceLabel!
    @IBOutlet weak var lblPeriod: WKInterfaceLabel!
    
//    let skill: Skill!
    
    //MARK - Methods of this ViewController
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

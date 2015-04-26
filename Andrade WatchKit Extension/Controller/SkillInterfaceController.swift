//
//  SkillInterfaceController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/25/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import WatchKit
import Foundation


class SkillInterfaceController: WKInterfaceController {

    @IBOutlet weak var lblName: WKInterfaceLabel!
    @IBOutlet weak var skillTable: WKInterfaceTable!
    
    var categorie: Categories!
    
    //MARK: - Custom Methods
    
    func loadData() {
        
        skillTable.setNumberOfRows(self.categorie.skills.count, withRowType: "SkillRow")
        
        for (index, skill) in enumerate(self.categorie.skills) {
            if let row = skillTable.rowControllerAtIndex(index) as? SkillInterfaceRow {
                row.txtSkillName.setText(skill.name)
            }
        }
    }
    
    //MARK - Methods of this ViewController
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let categorie = context as? Categories {
            
            self.categorie = categorie
            self.lblName.setText(categorie.name)
            
            loadData()
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        if segueIdentifier == "SegueDetailInterface" {
            
            let skill = self.categorie.skills.objectAtIndex(rowIndex) as! Skill
            return skill
            
        }
        
        return nil
    }

}
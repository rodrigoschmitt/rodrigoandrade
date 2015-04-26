//
//  PerfilInterfaceController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/25/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import WatchKit
import Foundation

class PerfilInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var imgProfile: WKInterfaceImage!
    @IBOutlet weak var skillsTable: WKInterfaceTable!
    
    var skills: Skills!
    var indexPath: NSIndexPath!
    
    //MARK: - Custom Methods
    
    func loadData() {
        
        let raManager = RAManager()
        let profile = raManager.requestProfile()
        
        self.imgProfile.setImageNamed(profile.avatarWatch)
        
        self.skills = profile.skills
        
        skillsTable.setNumberOfRows(self.skills.categories.count, withRowType: "SkillsRow")
        
        for (index, category) in enumerate(self.skills.categories) {
            if let row = skillsTable.rowControllerAtIndex(index) as? SkillInterfaceRow {
                row.txtSkillName.setText(category.name)
            }
        }
    }
    
    //MARK - Methods of this ViewController
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadData()
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
        if segueIdentifier == "SegueSkillInterface" {
            
            let category = self.skills.categories.objectAtIndex(rowIndex) as! Categories
            return category
            
        }
        
        return nil
    }
}

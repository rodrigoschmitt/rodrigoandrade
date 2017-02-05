//
//  PerfilInterfaceController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/25/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import WatchKit
import Foundation

class PerfilInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var imgProfile: WKInterfaceImage!
    @IBOutlet weak var skillsTable: WKInterfaceTable!
    
    var skills: Skills!
    var indexPath: IndexPath!
    
    //MARK: - Custom Methods
    
    func loadData() {
        
        let raManager = RAManager()
        let profile = raManager.requestProfile()
        
        self.imgProfile.setImageNamed(profile.avatarWatch)
        
        self.skills = profile.skills
        
        skillsTable.setNumberOfRows(self.skills.categories.count, withRowType: "SkillsRow")
        
        for (index, category) in self.skills.categories.enumerated() {
            if let row = skillsTable.rowController(at: index) as? SkillInterfaceRow {
                if let category = category as? Categories {
                    row.txtSkillName.setText(category.name)
                }
            }
        }
    }
    
    //MARK - Methods of this ViewController
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
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
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        if segueIdentifier == "SegueSkillInterface" {
            
            let category = self.skills.categories.object(at: rowIndex) as! Categories
            return category
            
        }
        
        return nil
    }
}
//
//extension Sequence {
//    func enumerate() -> EnumerateSequence<Self>
//}

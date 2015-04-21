//
//  SkillViewController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/19/15.
//  Copyright (c) 2015 Grupo RBS. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var imgBackgroundBlur: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var skills: NSArray!
    var showMapLocation: Bool = false
    var location: Location!
    
    //MARK: Methods of UIButton (IBAction)
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //MARK: Custom Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor.clearColor()
        
        self.view.backgroundColor = UIColor.clearColor()
        
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: effect)
        
        blurView.frame = self.view.bounds
        
        self.self.imgBackgroundBlur.addSubview(blurView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if showMapLocation {
            return 1
        } else {
            return self.skills.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if showMapLocation {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellMap", forIndexPath: indexPath) as! MapCollectionViewCell
            cell.showLocation(self.location.latitude, longitude: self.location.longitude, locationName: self.location.name)
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 4
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellDetail", forIndexPath: indexPath) as! DetailCollectionViewCell
            
            let skill: Skill = self.skills.objectAtIndex(indexPath.row) as! Skill
            
            cell.lblName.text = skill.name
            cell.imgSkill.image = skill.photo
            cell.lblTitle.text = skill.title
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 4
            
            let util = Util()
            cell.lblPeriod.text = util.formatDate(skill.since)
            
            return cell
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if (UIScreen.mainScreen().nativeBounds.height < 1334)
        {
            return CGSize(width: 300, height: 460)
        }
        else
        {
            return CGSize(width: 350, height: 500)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if !showMapLocation {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

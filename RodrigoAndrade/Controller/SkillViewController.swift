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
    
    let util = Util()
    var skills: NSArray!
    var showMapLocation: Bool = false
    var location: Location!
    
    //MARK: Methods of UIButton (IBAction)
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func linkButtonPressed(sender: UIButton) {
        let skill: Skill = self.skills.objectAtIndex(sender.tag) as! Skill
        
        UIApplication.sharedApplication().openURL(NSURL(string:skill.link)!)
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
            
            if skill.period == nil {
                cell.lblPeriod.text = util.formatDate(skill.since)
            }
            else
            {
                cell.lblPeriod.text = skill.period
            }
            
            if skill.linkButton == nil {
                cell.btnLink.hidden = true
            }
            else
            {
                cell.btnLink.hidden = false
                cell.btnLink.setTitle(skill.linkButton, forState: UIControlState.Normal)
                cell.btnLink.tag = indexPath.row
            }
            
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 4
            
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

}

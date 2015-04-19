//
//  ProfileViewController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo S Andrade on 4/17/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var skills: Skills!
    let util = Util()
    
    //MARK: Custom Methods
    
    func loadData() {
        
        let raManager = RAManager()
        let profile = raManager.requestProfile()
        let location = profile.location
        
        imgProfile.image = profile.avatar
        lblName.text = profile.name
        lblJob.text = profile.job
        
        lblLocation.text = location.name
        
        self.skills = profile.skills
        
        self.collectionView.reloadData()
    }
    
    //MARK: Methods of this ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        util.circularProfile(self.imgProfile, borderWith: 1.0)
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.skills.categories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SkillCollectionViewCell
        
        let category = skills.categories.objectAtIndex(indexPath.row) as! Categories
        let skill: Skill = category.skills.objectAtIndex(0) as! Skill
        
        cell.lblSkill.text = category.name
        cell.imgSkill.image = skill.photo
        cell.lblClock.text = util.calculateAge(skill.since) as? String
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
        if (UIScreen.mainScreen().nativeBounds.height < 1334)
        {
            return CGSize(width: 152, height: 160)
        }
        else
        {
            return CGSize(width: 180, height: 188)
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

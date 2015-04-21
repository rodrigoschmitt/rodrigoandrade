//
//  ProfileViewController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo S Andrade on 4/17/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnLocation: UIButton!
    
    var skills: Skills!
    var indexPath: NSIndexPath!
    let util = Util()
    
    //MARK: Methods of UIButton (IBAction)
    @IBAction func locationButtonPressed(sender: AnyObject) {
    
    }
    
    //MARK: Custom Methods
    
    func loadData() {
        
        let raManager = RAManager()
        let profile = raManager.requestProfile()
        let location = profile.location
        
        imgProfile.image = profile.avatar
        lblName.text = profile.name
        lblJob.text = profile.job
        
        btnLocation.setTitle(location.name, forState: UIControlState.Normal)
        
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        let category = self.skills.categories.objectAtIndex(self.indexPath.row) as! Categories
        
        let skillViewController: SkillViewController = segue.destinationViewController as! SkillViewController
        skillViewController.skills = category.skills
        
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.skills.categories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! SkillCollectionViewCell
        
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.indexPath = indexPath
        
        performSegueWithIdentifier("segueSkill", sender: self)
        
    }

}

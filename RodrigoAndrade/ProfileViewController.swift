//
//  ProfileViewController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo S Andrade on 4/17/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SkillViewControllerDelegate  {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnLocation: UIButton!
    
    var skills: Skills!
    var location: Location!
    var indexPath: NSIndexPath!
    let util = Util()
    var blurView = UIVisualEffectView()
    
    //MARK: - Methods of UIButton (IBAction)
    @IBAction func locationButtonPressed(sender: AnyObject) {
        openSkills(sender)
    }
    
    //MARK: - Custom Methods
    
    func loadData() {
        
        let raManager = RAManager()
        let profile = raManager.requestProfile()
        self.location = profile.location
        
        imgProfile.image = profile.avatar
        lblName.text = profile.name
        lblJob.text = profile.job
        
        btnLocation.setTitle(self.location.name, forState: UIControlState.Normal)
        
        self.skills = profile.skills
        
        self.collectionView.reloadData()
    }
    
    func openSkills(sender: AnyObject) {
        
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurView = UIVisualEffectView(effect: effect)
        blurView.frame = self.view.bounds
        blurView.alpha = 0.0
        
        self.view.addSubview(blurView)
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.blurView.alpha = 1.0
            
            }, completion: nil)
        
        performSegueWithIdentifier("segueSkill", sender: sender)
        
    }
    
    //MARK: - Methods of SkilViewController (Delegate)
    
    func doneSkillViewController() {
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.blurView.alpha = 0.0
            
            }, completion: {
                
                (value: Bool) in
                
                self.blurView.removeFromSuperview()
                
        })
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Methods of this ViewController
    
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
        
        let skillViewController: SkillViewController = segue.destinationViewController as! SkillViewController
        skillViewController.delegate = self
        
        if sender is UIButton {
            skillViewController.showMapLocation = true
            skillViewController.location = self.location
            
        } else {
            let category = self.skills.categories.objectAtIndex(self.indexPath.row) as! Categories
            skillViewController.skills = category.skills
        }
    
        
    }
    
    // MARK: - UICollectionViewDataSource
    
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
            
        if UIScreen.mainScreen().nativeBounds.height < 1334
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
        
        openSkills(self)
        
    }

}

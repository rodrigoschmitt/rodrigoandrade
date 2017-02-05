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
    var indexPath: IndexPath!
    let util = Util()
    var blurView = UIVisualEffectView()
    
    //MARK: - Methods of UIButton (IBAction)
    @IBAction func locationButtonPressed(_ sender: AnyObject) {
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
        
        btnLocation.setTitle(self.location.name, for: UIControlState())
        
        self.skills = profile.skills
        
        self.collectionView.reloadData()
    }
    
    func openSkills(_ sender: AnyObject) {
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurView = UIVisualEffectView(effect: effect)
        blurView.frame = self.view.bounds
        blurView.alpha = 0.0
        
        self.view.addSubview(blurView)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.blurView.alpha = 1.0
            
            }, completion: nil)
        
        performSegue(withIdentifier: "segueSkill", sender: sender)
        
    }
    
    //MARK: - Methods of SkilViewController (Delegate)
    
    func doneSkillViewController() {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.blurView.alpha = 0.0
            
            }, completion: {
                
                (value: Bool) in
                
                self.blurView.removeFromSuperview()
                
        })
        
        
        self.dismiss(animated: true, completion: nil)
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
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let skillViewController: SkillViewController = segue.destination as! SkillViewController
        skillViewController.delegate = self
        
        if sender is UIButton {
            skillViewController.showMapLocation = true
            skillViewController.location = self.location
            
        } else {
            let category = self.skills.categories.object(at: self.indexPath.row) as! Categories
            skillViewController.skills = category.skills
        }
    
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.skills.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SkillCollectionViewCell
        
        let category = skills.categories.object(at: indexPath.row) as! Categories
        let skill: Skill = category.skills.object(at: 0) as! Skill
        
        cell.lblSkill.text = category.name
        cell.imgSkill.image = skill.photo
        cell.lblClock.text = util.calculateAge(skill.since) as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
            
        if UIScreen.main.nativeBounds.height < 1334
        {
            return CGSize(width: 152, height: 160)
        }
        else
        {
            return CGSize(width: 180, height: 188)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.indexPath = indexPath
        
        openSkills(self)
        
    }

}

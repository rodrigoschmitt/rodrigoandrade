//
//  SkillViewController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo Andrade on 4/19/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

protocol SkillViewControllerDelegate {
    
    func doneSkillViewController()
    
}

class SkillViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate: SkillViewControllerDelegate!
    
    @IBOutlet weak var imgBackgroundBlur: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let util = Util()
    var skills: NSArray!
    var showMapLocation: Bool = false
    var location: Location!
    
    //MARK: - Methods of UIButton (IBAction)
    
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        
        delegate.doneSkillViewController()
        
    }
    
    @IBAction func linkButtonPressed(_ sender: UIButton) {
        let skill: Skill = self.skills.object(at: sender.tag) as! Skill
        
        UIApplication.shared.openURL(URL(string:skill.link)!)
    }
    
    //MARK: - Custom Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.clear
        
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -35;
        verticalMotionEffect.maximumRelativeValue = 35;
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -15;
        horizontalMotionEffect.maximumRelativeValue = 15;
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect];
        
        // Add both effects to your view
        self.collectionView.addMotionEffect(group)
        
        
        if showMapLocation || self.skills.count == 1 {
            pageControl.isHidden = true
        }
        
        if !showMapLocation {
            pageControl.numberOfPages = self.skills.count
            pageControl.currentPage = 0
            pageControl.addTarget(self, action: #selector(SkillViewController.changePage(_:)), for: UIControlEvents.valueChanged)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if showMapLocation {
            return 1
        } else {
            return self.skills.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if showMapLocation {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMap", for: indexPath) as! MapCollectionViewCell
            cell.showLocation(self.location.latitude, longitude: self.location.longitude, locationName: self.location.name)
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 4
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDetail", for: indexPath) as! DetailCollectionViewCell
            
            let skill: Skill = self.skills.object(at: indexPath.row) as! Skill
            
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
                cell.btnLink.isHidden = true
            }
            else
            {
                cell.btnLink.isHidden = false
                cell.btnLink.setTitle(skill.linkButton, for: UIControlState())
                cell.btnLink.tag = indexPath.row
            }
            
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 4
            
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        if (UIScreen.main.nativeBounds.height < 1136)
        {
            return CGSize(width: 300, height: 435)
        }
        else if (UIScreen.main.nativeBounds.height < 1334)
        {
            return CGSize(width: 300, height: 460)
        }
        else
        {
            return CGSize(width: 350, height: 500)
        }
        
    }
    
    //MARK: - PageControl
    
    func changePage(_ sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * self.collectionView.frame.size.width
        self.collectionView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
    }
    
}

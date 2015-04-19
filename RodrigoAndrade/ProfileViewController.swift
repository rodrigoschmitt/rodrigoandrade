//
//  ProfileViewController.swift
//  RodrigoAndrade
//
//  Created by Rodrigo S Andrade on 4/17/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    //MARK: Custom Methods
    
    func loadData() {
        
        let raManager = RAManager()
        let profile = raManager.requestProfile()
        let location = profile.location
        
        imgProfile.image = profile.avatar
        lblName.text = profile.name
        lblJob.text = profile.job
        
        lblLocation.text = location.name
        
    }
    
    //MARK: Methods of this ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let util = Util()
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

}

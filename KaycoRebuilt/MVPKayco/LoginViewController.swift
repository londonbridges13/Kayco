//
//  LoginViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/17/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet var eTXT : UITextField!
    
    @IBOutlet var pTXT : UITextField!

    @IBOutlet var SUbutton : UIButton!
    
    @IBOutlet var LGbutton : UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SUbutton.layer.cornerRadius = 3
        SUbutton.layer.masksToBounds = true
        
        LGbutton.layer.cornerRadius = 3
        LGbutton.layer.masksToBounds = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SIverify(){
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: UITabBarController = storyboard.instantiateViewControllerWithIdentifier("homeT") as! UITabBarController
        
        self.presentViewController(vc, animated: true, completion: nil)
        

    }
    
    @IBAction func LGverify(){
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: UITabBarController = storyboard.instantiateViewControllerWithIdentifier("homeT") as! UITabBarController
        
        self.presentViewController(vc, animated: true, completion: nil)
        

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

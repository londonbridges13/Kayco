//
//  mSlide1VC.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/31/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class mSlide1VC: UIViewController {

    
    var parentNavigationController : UINavigationController?

    let it = UILabel(frame: CGRect(x: 20,y: 100,width: 150,height: 60))
    let icon = UIImageView(frame: CGRect(x: 5,y: 70, width: 45, height: 45))
    let bIMG = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 128))
    let tIMG = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 128))
    let more = UIButton(type: UIButtonType.Custom) as UIButton

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Background IMG
        bIMG.image = UIImage(named: "collegeIMG")
        
        view.addSubview(bIMG)
        
        
        // Tint
        tIMG.image = UIImage(named: "tint")
        
        view.addSubview(tIMG)
        
        
        //
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 140)
        view.center = CGPointMake(0, 0)
        //
        
        
        // More Button
        more.frame = CGRectMake(220, 80, 63, 35)
        // more.setTitle("Test Button", forState: UIControlState.Normal)
        more.setImage(UIImage(named: "more"), forState: UIControlState.Normal)
        //        more.addTarget(self, action: "moreAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        view.addSubview(more)
        
        
        
        
       // Event Label
        it.numberOfLines = 0
        it.center = CGPointMake(130, 100)
        it.textAlignment = NSTextAlignment.Natural
        it.text = "Miss"
        it.textColor = UIColor.redColor()
        view.addSubview(it)
        
        
        
  
        
                // Event Icon
        icon.image = UIImage(named: "KaycoFaded")
        
        view.addSubview(icon)
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

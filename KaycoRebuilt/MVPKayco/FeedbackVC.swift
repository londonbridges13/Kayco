//
//  FeedbackVC.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/9/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse


class FeedbackVC: UIViewController {

    @IBOutlet var FeedbackTXT : UITextView!
    @IBOutlet var aSendButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendHer(){
        let fb = PFObject(className: "Feedback")
        
        if FeedbackTXT.text != nil{
            fb["Feedback"] = FeedbackTXT.text
            fb.saveInBackgroundWithBlock({ (success: Bool, error : NSError?) -> Void in
                if (success == true){
                    print("Saved Feedback")
                }else{
                }
            })
        }else{
            print("Type Something")
        }
        
    }
    
    @IBAction func Send(){
        aSendButton.sendActionsForControlEvents(.TouchUpInside)
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

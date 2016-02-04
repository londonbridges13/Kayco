//
//  aTestViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/26/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class aTestViewController: UIViewController {

    
    @IBOutlet var callyButton: UIButton!
    
    @IBOutlet var testIMGView: UIImageView!
    
    @IBOutlet var testTypeLabel: UILabel!
    
    
    @IBOutlet var testDateLabel: UILabel!
    
    var test : String?
    
    var theDate : NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callyButton.layer.cornerRadius = 8
        callyButton.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        print(test)
        
        if test == "s"{
            testTypeLabel.text = "SAT Test:"
            testIMGView.image = UIImage(named: "SAT LOGO")
        }else{
            testTypeLabel.text = "ACT Test:"
            testIMGView.image = UIImage(named: "ACT Logo")

        }
        
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        
        let string = dateFormatter.stringFromDate(theDate!)
        
        print(string)
        testDateLabel.text = string
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        Verify()
    }
    
    func Verify(){
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

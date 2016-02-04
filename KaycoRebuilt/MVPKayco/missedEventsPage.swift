//
//  missedEventsPage.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/2/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class missedEventsPage: UIViewController {

    var eNameLabel = UILabel(frame: CGRect(x: 300, y: 280, width: 100, height: 20))
    
    
    //segued strings
    var eventName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        if eventName == nil{
        //            eventName = "Loading..."
        //        }
        eNameLabel.text = eventName!
        
        
        eNameLabel.numberOfLines = 0
        eNameLabel.center = CGPointMake(130, 280)
        eNameLabel.textAlignment = NSTextAlignment.Natural
        view.addSubview(eNameLabel)
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

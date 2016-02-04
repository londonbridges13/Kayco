//
//  EventsViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/27/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet var ctoName : UILabel!
    @IBOutlet var ctoD : UILabel!
    @IBOutlet var eventLabel : UILabel!
    @IBOutlet var iconIMG : UIImageView!
    @IBOutlet var pictureIMG : UIImageView!
    
    var iconIMGt : UIImage?
    var pictureIMGt : UIImage?
    
    var itNA : String?
    var eNA : String?
    var dNA : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if iconIMGt != nil{
            iconIMG.image = iconIMGt
        }else{
            iconIMG.image = UIImage(named: "DefaultCollegeImg")
        }
        if pictureIMGt != nil{
            pictureIMG.image = pictureIMGt
        }else{
            pictureIMG.image = UIImage(named: "collegeIMG")
        }
        ctoName.text = itNA!
        eventLabel.text = eNA!
        ctoD.text = dNA!
        
        
        
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

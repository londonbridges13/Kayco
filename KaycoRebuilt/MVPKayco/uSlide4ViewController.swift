//
//  uSlide4ViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/31/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class uSlide4ViewController: UIViewController {

    
    
    var parentNavigationController : UINavigationController?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.frame = CGRect(x: 0, y: 0, width: 320, height: 100)
        view.center = CGPointMake(0, 0)
        
        let it = UILabel(frame: CGRect(x: 17,y: 100,width: 20,height: 20))
        it.center = CGPointMake(20, 100)
        it.textAlignment = NSTextAlignment.Center
        it.text = "Hi"
        view.addSubview(it)
        
        view.backgroundColor = UIColor.redColor()
        
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

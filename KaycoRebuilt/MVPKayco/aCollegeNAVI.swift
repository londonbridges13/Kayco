//
//  aCollegeNAVI.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/25/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class aCollegeNAVI: UINavigationController {

    
    @IBOutlet var navibar : UINavigationBar!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
//        navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 10)!]

        
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
//        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 17)!]

//        view.roundCorners([.TopLeft , .TopRight], radius: 10)
        
//        naviBar.layer.cornerRadius = 13
        
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

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
}

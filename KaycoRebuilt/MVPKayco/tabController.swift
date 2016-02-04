//
//  tabController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/31/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import Foundation
import UIKit

class tabController : UITabBarController{
    
        var addColor : UIColor = UIColor(red: 9/255, green: 209/255, blue: 196/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = true
        
        UITabBar.appearance().tintColor = addColor

        
//        
    }
    




}
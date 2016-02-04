//
//  loadingPageSubView.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/1/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class loadingPageSubView: UIViewController {

    var ActIndi : UIActivityIndicatorView!
    
    
    override func viewDidAppear(animated: Bool) {
        
        view.frame = CGRectMake(0, 0, 100, 100)
        
        ActIndi.color = UIColor.cyanColor()
        
    }
    
    override func viewDidLoad() {
        
        
        
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  EventCell3.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/17/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class EventCell3: UITableViewCell {
 
    @IBOutlet var iconIMGView: UIImageView!
    
    @IBOutlet var collegeNameLabel: UILabel!
    
    var icon : UIImage?
    var collegeName : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if collegeName != nil{
            collegeNameLabel.text = collegeName
        }
        
        if icon != nil{
            iconIMGView.image = icon!
        }else{
            iconIMGView.image = UIImage(named: "DefaultCollegeImg")
            
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

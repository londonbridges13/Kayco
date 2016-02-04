//
//  eventsTVCell.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/27/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class eventsTVCell: UITableViewCell {

    @IBOutlet var iconIMG: UIImageView!
    
    @IBOutlet var ctoTitle: UILabel!
    
    @IBOutlet var eventNameLabel: UILabel!
    
    @IBOutlet var backgroundVIEW: UIImageView!
    
    var iconFile : PFFile?
    
    var icon : UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundVIEW.layer.cornerRadius = 8
        backgroundVIEW.layer.masksToBounds = true
        
        if icon != nil{
            iconIMG.image = icon
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

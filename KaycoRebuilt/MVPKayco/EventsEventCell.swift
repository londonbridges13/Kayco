//
//  EventsEventCell.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/14/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class EventsEventCell: UITableViewCell {

    @IBOutlet var eLabel: UILabel!
    
    @IBOutlet var iconIMGVIEW: UIImageView!
    
    @IBOutlet var eventIMG: UIImageView!
    
    @IBOutlet var buttn: UIButton!
    
    var fileholder : PFFile?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        eventIMG.layer.cornerRadius = 8
        eventIMG.layer.shadowOpacity = 0.7
        eventIMG.layer.shadowColor = UIColor.blackColor().CGColor
        eventIMG.layer.shadowOffset = CGSize(width: 0.6, height: 2)
        eventIMG.layer.shadowRadius = 1


        

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  EventCell2.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/17/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class EventCell2: UITableViewCell {

    @IBOutlet var DateLabel: UILabel!
    
    var covertDate : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if covertDate != nil{
            DateLabel.text = covertDate!
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

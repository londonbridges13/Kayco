//
//  EventFlexCell.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/17/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class EventFlexCell: UITableViewCell {

    @IBOutlet var mylabel : UILabel!
     
    var eventDescription: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if eventDescription != nil{
            mylabel.text = eventDescription!
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

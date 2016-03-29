//
//  WikiDCell.swift
//  KaycoRebuilt
//
//  Created by Lyndon Samual McKay on 3/18/16.
//  Copyright © 2016 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class WikiDCell: UITableViewCell {

    @IBOutlet var collegeLabel : UILabel!
    @IBOutlet var DLabel :UITextView!  // UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

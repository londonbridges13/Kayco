//
//  WikiPCell.swift
//  KaycoRebuilt
//
//  Created by Lyndon Samual McKay on 3/18/16.
//  Copyright © 2016 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class WikiPCell: UITableViewCell {

    @IBOutlet var cIcon : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cIcon.layer.shadowOpacity = 0.7
        cIcon.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }

}

//
//  SearchTableViewCell.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/12/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class SearchTableViewCell: UITableViewCell {

    var cellIconFile : PFFile?
    @IBOutlet var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  aCP1Cell.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/2/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class aCP1Cell: UITableViewCell {

    @IBOutlet var cLOGO: UIImageView!
    
    @IBOutlet var backgroundPicView: UIImageView!
    @IBOutlet var inTuitionLabel: UILabel!
    
    @IBOutlet var outTuitionLabel: UILabel!
    
    var cloFile : PFFile?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        cLOGO.layer.shadowOpacity = 0.7
//        cLOGO.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

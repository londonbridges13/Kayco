//
//  aCP2Cell.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/2/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class aCP2Cell: UITableViewCell {

    
    
    @IBOutlet weak var addCollegeBlueButton : UIButton!
     
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addCollegeBlueButton.layer.shadowColor = UIColor.blackColor().CGColor
        addCollegeBlueButton.layer.shadowOpacity = 0.7
        addCollegeBlueButton.layer.shadowOffset = CGSize(width: 1, height: 5)
        addCollegeBlueButton.layer.shadowRadius = 5
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

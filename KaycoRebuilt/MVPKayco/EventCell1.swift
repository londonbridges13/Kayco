//
//  EventCell1.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/17/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class EventCell1: UITableViewCell {

    @IBOutlet var collegePicIMGView: UIImageView!
    
    @IBOutlet var EventTitleLabel: UILabel!
    
    var IMGTransfer : UIImage?
    var eventGO : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if eventGO != nil{
            EventTitleLabel.text = eventGO!
        }
        
        if IMGTransfer != nil{
            collegePicIMGView.image = IMGTransfer!
        }else{
            collegePicIMGView.image = UIImage(named: "collegeIMG")
            

        }
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

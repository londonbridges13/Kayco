//
//  WikiDescriptionTVC.swift
//  KaycoRebuilt
//
//  Created by Lyndon Samual McKay on 3/18/16.
//  Copyright © 2016 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class WikiDescriptionTVC: UITableViewController {

    
    var College : String?
    var CollegeDescription : String?
    var collegeIcon : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.College == nil{
            self.College = "HEYEHY Uni"
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.row == 0{
            let cell : WikiDCell = tableView.dequeueReusableCellWithIdentifier("WikiDCell", forIndexPath: indexPath) as! WikiDCell
            
            // Configure the cell...
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 363//319//195
            
            if College != nil{
                cell.collegeLabel.text = self.College!
            
            let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
            let underlineAttributedString = NSAttributedString(string: self.College!, attributes: underlineAttribute)
            cell.collegeLabel.attributedText = underlineAttributedString
            }
            if CollegeDescription != nil{
                cell.DLabel.text = self.CollegeDescription!
            }
            
            
            return cell
            
        }else{
            let cell : WikiPCell = tableView.dequeueReusableCellWithIdentifier("WikiPCell", forIndexPath: indexPath) as! WikiPCell
            
            // Configure the cell...
            tableView.rowHeight = 80//UITableViewAutomaticDimension
//            tableView.estimatedRowHeight = 80
            
            if collegeIcon != nil{
                cell.cIcon.image = self.collegeIcon!
            }
            
            cell.cIcon.layer.shadowOpacity = 0.7
            cell.cIcon.layer.shadowOffset = CGSize(width: 0, height: 2)
            
            return cell

        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

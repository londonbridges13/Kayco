//
//  EventPageTVC.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/17/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class EventPageTVC: UITableViewController {

    var array = ["lklkkklsdjfgkhlkghsdfkghalskgfdks;alfjlks;djflsdjflkdj fsdklfj sdljf sdj f;lksdj f;djs f; sd;fl jsd; flsdj f;lsd lf ;dsl;fj sdl f;lf ls;djf ;lsa jdflajs flkja lf a;jf ;lajfLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."]
    
    
    var iconIMGt : UIImage?
    var pictureIMGt : UIImage?
    
    var itNA : String?   // name of college
    var eNA : String?    // name of event
    var dNA : String?    // description of event
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        print(itNA)
        print(dNA)
        print(eNA)
        tableView.estimatedRowHeight = 146.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.    199, 60
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell : EventCell1 = tableView.dequeueReusableCellWithIdentifier("eveC1", forIndexPath: indexPath) as! EventCell1
            
            if self.eNA != nil{
            cell.EventTitleLabel.text = self.eNA!
            }
            
            if self.pictureIMGt != nil{
                cell.collegePicIMGView.image = self.pictureIMGt
            }
//            cell.mylabel.text = array[indexPath.row]
            // Configure the cell...
            tableView.rowHeight = 199
            return cell
            
        case 1:
            let cell : EventCell2 = tableView.dequeueReusableCellWithIdentifier("eveC2", forIndexPath: indexPath) as! EventCell2
            
//            cell.mylabel.text = array[indexPath.row]
            // Configure the cell...
            tableView.rowHeight = 60

            return cell
        case 2:
            let cell : EventCell3 = tableView.dequeueReusableCellWithIdentifier("eveC3", forIndexPath: indexPath) as! EventCell3
            
            if self.iconIMGt != nil{
                cell.iconIMGView.image = self.iconIMGt!
            }
            
            if self.itNA != nil{
                cell.collegeNameLabel.text = itNA!
            }
//            cell.mylabel.text = array[indexPath.row]
            // Configure the cell...
            tableView.rowHeight = 78

            return cell
        case 3:
            let cell : EventFlexCell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier2", forIndexPath: indexPath) as! EventFlexCell
            if self.dNA != nil{
            cell.mylabel.text = self.dNA!
            }
            
            // Configure the cell...
            tableView.estimatedRowHeight = 146.0
            tableView.rowHeight = UITableViewAutomaticDimension
            
            return cell

        default:
            let cell : EventFlexCell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier2", forIndexPath: indexPath) as! EventFlexCell

            cell.mylabel.text = array[indexPath.row]
            // Configure the cell...

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

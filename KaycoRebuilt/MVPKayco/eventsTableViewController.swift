//
//  eventsTableViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/11/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class eventsTableViewController: UITableViewController {

    var aCollege : String?
    
    var eventsArray = [String]()
    var eventDArray = [String]()
    var eventIMGFileArray = [PFFile]()
    var eventActualIMGArray = [UIImage]()
    var iconIMG : UIImage?
    var ico = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        getEvents()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return eventsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: EventsEventCell = tableView.dequeueReusableCellWithIdentifier("eecell", forIndexPath: indexPath) as! EventsEventCell

        // Configure the cell...
        cell.eLabel.text = self.eventsArray[indexPath.row]
        if self.iconIMG != nil{
            cell.iconIMGVIEW.image = self.iconIMG!
            self.ico.append(self.iconIMG!)

        }
        cell.fileholder = self.eventIMGFileArray[indexPath.row]
        cell.fileholder?.getDataInBackgroundWithBlock({ (theData: NSData?, error:NSError?) -> Void in
            let image : UIImage = UIImage(data: theData!)!
            cell.eventIMG.image = image
            
            self.eventActualIMGArray.append(image)
        })
        tableView.rowHeight = 199
        return cell
    }
    

    
    
    
    func getEvents(){
        let eQuery = PFQuery(className: "Events")
        eQuery.whereKey("collegeName", equalTo: self.aCollege!)
        
        eQuery.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                        let eventName = result["eventName"] as? String
                        let eventD = result["description"] as? String
                        let EventIMG = result["picture"] as? PFFile
                        
                        if eventName != nil{
                            self.eventsArray.append(eventName!)
                            print(eventName!)
                        }else{print("Progo")}
                        
                        if eventD != nil{
                            self.eventDArray.append(eventD!)
                            print(eventD!)
                        }
                        
                        if EventIMG != nil{
                            self.eventIMGFileArray.append(EventIMG!)
                            print(EventIMG!)
                        }else{
                            let data = UIImagePNGRepresentation(UIImage(named: "collegeIMG")!)
                            
                            let pData = PFFile(data: data!)
                            
                            self.eventIMGFileArray.append(pData!)
                            print("DefaultIMG")
                        }
                        
//                        self.ico.append(self.iconIMG!)
                        
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc : EventPageTVC = segue.destinationViewController as! EventPageTVC
        
        let index = tableView.indexPathForSelectedRow!
        vc.itNA = self.aCollege!
        vc.dNA = self.eventDArray[index.row]
        vc.eNA = self.eventsArray[index.row]
        if self.iconIMG != nil{
            vc.iconIMGt = self.iconIMG!
        }else{   print(self.ico.count);  vc.iconIMGt = self.ico[0]    }
        
        vc.pictureIMGt = self.eventActualIMGArray[index.row]
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

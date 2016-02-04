//
//  ExploreController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/18/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class ExploreController: UITableViewController {

    @IBOutlet var naviItem: UINavigationItem!
    @IBOutlet var upELabel: UILabel!
    @IBOutlet var miELabel: UILabel!
    @IBOutlet var ctwLabel: UILabel!
    @IBOutlet var upTLabel: UILabel!
    
    @IBOutlet var searchButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDB()
                
    
        upELabel.roundCorners([.BottomLeft, .BottomRight], radius: 11)
        
        miELabel.roundCorners([.BottomLeft, .BottomRight], radius: 11)
        
        
        ctwLabel.roundCorners([.BottomLeft, .BottomRight], radius: 11)
        
        upTLabel.roundCorners([.BottomLeft, .BottomRight], radius: 11)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    @IBAction func it(){
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
        
        print(NSThread.isMainThread())
        
        print("check1212")
            
//            self.gogogo.sendActionsForControlEvents(.TouchUpInside)
        self.performSegueWithIdentifier("justgo", sender: ExploreController())
//        presentViewController(EventsViewController(), animated: true, completion: nil)
        }
    }
    
    @IBOutlet var gogogo: UIButton!
    
    @IBAction func gogogo(sender: AnyObject) {
        print("hphp ")
//        performSegueWithIdentifier("justgo", sender: ExploreController())
    }
    
    
    
    @IBAction func unwindSegueExplorer(segue : UIStoryboardSegue){
        print("pushed")
        
        if segue.identifier == "p"{
            print(")it")
            performSegueWithIdentifier("p", sender: self)
            
        }else{
            
            navigationController!.popViewControllerAnimated(true)

        }
        
        
    }
    
    func createDB(){
        // ********* Move to the "FirstTimer Page"
//        let ty = SD.deleteTable("myNColleges")
        
        if let _ = SD.createTable("Events", withColumnNamesAndTypes: ["EventName": .StringVal, "CTO": .StringVal, "Date": .DateVal, "Description": .StringVal]){
        }else{
            print("built it Events")
        }
        
        if let _ = SD.createTable("myColleges", withColumnNamesAndTypes: ["collegeName": .StringVal, "ID": .IntVal, "icon": .UIImageVal]){
            
        }else{
            print("built it a NEW myColleges")
        }
        
        
        if let _ = SD.executeChange("CREATE TABLE myNColleges (ID INTEGER PRIMARY KEY AUTOINCREMENT, collegeName TEXT, icon TEXT)") {
            //there was an error during this function, handle it here
        } else {
            //no error, the table was created successfully
            print("Hey new table don't fuck up this time")
        }
        
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 4
        /*
        switch (section){
            
        case 0:
            return 1
            
        case 1:
            return 1
            
        default:
            return 2

        }*/
        
        
        //return 4
    }
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch (indexPath.section){
        case 0:
            
            let cell : UpcomingEventsCell = tableView.dequeueReusableCellWithIdentifier("upE", forIndexPath: indexPath) as! UpcomingEventsCell

        // Configure the cell...

        return cell
            
        case 1:
            
            let cell : MissedEventsCell = tableView.dequeueReusableCellWithIdentifier("miE", forIndexPath: indexPath) as! MissedEventsCell
            
            // Configure the cell...
            
            return cell
            
            
            
        default:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("miT", forIndexPath: indexPath)
            
            // Configure the cell...
            
            return cell
            
        }
        
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gogogo"{
            
//        let dvc : TestContainer = segue.destinationViewController as! TestContainer
        
        }
    }
    

}

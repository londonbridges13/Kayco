//
//  SearchTableViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/25/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class SearchTableViewController: UITableViewController, UISearchResultsUpdating, UINavigationBarDelegate {
         
    @IBOutlet var actINDI: UIActivityIndicatorView!
    
    var noarray = [String]()
    var QueryPredicate : NSPredicate?
    var qI = 0
        var collegeArray = ["Mizzou", "Missourei State University", "Washington University", "Kansas University", "University of Maine"]
    
        var beefs = [PFFile]()
        var filterCollegeArray = [String]()
        var resultSearchController = UISearchController()
        var goBgo : PFFile?
        override func viewDidLoad() {
            super.viewDidLoad()
            UINavigationBar.appearance().tintColor = UIColor.whiteColor()            
            collegeArray.removeAll()
            
            ststst()
            
    
            self.resultSearchController = UISearchController(searchResultsController: nil)
            self.resultSearchController.dimsBackgroundDuringPresentation = false
            self.resultSearchController.searchBar.sizeToFit()
            self.resultSearchController.searchResultsUpdater = self
            
            self.tableView.tableHeaderView = self.resultSearchController.searchBar
            
            self.resultSearchController.hidesNavigationBarDuringPresentation = false;
            self.definesPresentationContext = false;
            
            self.tableView.reloadData()
            
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
            
            if self.resultSearchController.active {
                return self.filterCollegeArray.count
            }else{
                
                return self.collegeArray.count
            }
            
        }
    
    
    
    
    
    
    func ststst(){
        while qI < 8{
            var t = self.qI + 1
            self.qI = t
            print(self.qI)
            collegeSearch()
        }
    }
    
    func findID(){
        let it = PFQuery(className: "Colleges")
        let indexPath = tableView.indexPathForSelectedRow
        var array = [String]()
        
        if (self.resultSearchController.active){
            array = self.filterCollegeArray
        }else{
            array = self.collegeArray
        }
        print(array)
        
        it.whereKey("college", equalTo: array[(indexPath?.row)!] )
        it.findObjectsInBackgroundWithBlock { (results:[PFObject]?, error:NSError?) -> Void in
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                    self.goBgo = result["collegeIcon"] as? PFFile
                    }
                }
            }
        }
        
    }
    func collegeSearch(){
        
        //collegeArray.removeAll()
        let queryColleges = PFQuery(className: "rere")

//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { [unowned self] in
            



//        }
        queryColleges.whereKey("ShipIt", equalTo: "yes")      
            
            
            if self.qI == 2{
                queryColleges.skip = 1000
                print("skipped")
            }
            if self.qI == 3{
                queryColleges.skip = 2000
                print("skipped")
            }
            if self.qI == 4{
                queryColleges.skip = 3000
                print("skipped")
            }
            if self.qI == 5{
                queryColleges.skip = 4000
                print("skipped")
            }
            if self.qI == 6{
                queryColleges.skip = 5000
                print("skipped")
            }
            if self.qI == 7{
                queryColleges.skip = 6000
                print("skipped")
            }
            if self.qI == 8{
                queryColleges.skip = 7000
                print("skipped")
            }



            queryColleges.limit = 1000
            queryColleges.whereKey("COLLEGES", notContainedIn: self.noarray)
            queryColleges.orderByAscending("COLLEGES")
        queryColleges.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            
            if error == nil{
                
                if let results = results as [PFObject]?{
                    
                    for result in results{
                        
                        let collegeName = result["COLLEGES"] as! String
                        // Query others later
//                        let beefile = result["collegeIcon"] as! PFFile
                        
                        self.collegeArray.append(collegeName)
//                        self.beefs.append(beefile)
                        print(collegeName)
                    }
                    
                }
                
                
            }
            self.noarray = self.collegeArray
            self.actINDI.stopAnimating()
            self.tableView.reloadData()

        }
//        }
//        self.qI += 1
        print(self.qI)
    }
        
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell : SearchTableViewCell = tableView.dequeueReusableCellWithIdentifier("searchcell", forIndexPath: indexPath) as! SearchTableViewCell
            
            if (self.resultSearchController.active) {
                cell.textLabel?.text = self.filterCollegeArray[indexPath.row]
                
                return cell
                
                
            } else {
                
                cell.textLabel?.text = self.collegeArray[indexPath.row]
                
                return cell
                
            }
        }
        
        
        
        
        
        func updateSearchResultsForSearchController(searchController: UISearchController) {
            
            self.filterCollegeArray.removeAll(keepCapacity: false)
            
            
            let searchPredicate = NSPredicate(format: "SELF CONTAINS [c] %@", searchController.searchBar.text!)
            
            
            
            let array = (self.collegeArray as NSArray).filteredArrayUsingPredicate(searchPredicate)
            
            self.filterCollegeArray = array as! [String]
            
            if array.count < 20 {
                print("ALERT")
            }
            
            print("CHECK!CHECK!CHECK!")
            
            self.tableView.reloadData()
            
            
            
        }
        
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            
            let vc : aCollegeNAVI = segue.destinationViewController as! aCollegeNAVI
            
            let ti = vc.viewControllers.first as! CollegePageTableViewController
            
            let indexPath = tableView.indexPathForSelectedRow
            
            if resultSearchController.active{
                ti.aCollege = "\(filterCollegeArray[indexPath!.row])"
            print(ti.aCollege)
            }else{
                ti.aCollege = "\(collegeArray[indexPath!.row])"
                print(ti.aCollege)
            }
           
            let it = PFQuery(className: "rere")
            var array = [String]()
            
            
                array = self.collegeArray
            print(array)
            
            it.whereKey("COLLEGES", equalTo: array[indexPath!.row])
            print(array[indexPath!.row])
            it.limit = 50
            it.findObjectsInBackgroundWithBlock { (results:[PFObject]?, error:NSError?) -> Void in
                if error == nil{
                    if let results = results as [PFObject]?{
                        for result in results{
                            
                            print(result.objectId)
//                            let oc = result["objectId"] as! String
//                            print(oc)
                            self.goBgo = result["collegeIcon"] as? PFFile
                            
                            if self.goBgo != nil{
                            print(self.goBgo!)
                            ti.beef = self.goBgo
                            }
                            
                            //ti.viewDidLoad()
                        }
                    }
                }
            }

            
            
            self.resultSearchController.active = false

            
        }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //  let indexPath = tableView.indexPathForSelectedRow?.row
        
        //let currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
        
        // print(currentCell!.textLabel!.text)
        
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

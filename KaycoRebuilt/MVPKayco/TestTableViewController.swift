//
//  TestTableViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/15/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {

    
    
    @IBOutlet var callyButton: UIButton!
    
    @IBOutlet var testIMGView: UIImageView!
    
    @IBOutlet var testTypeLabel: UILabel!
    
    
    @IBOutlet var testDateLabel: UILabel!
    
    
    @IBOutlet var RDLabel: UILabel!
    @IBOutlet var RPLabel: UILabel!
    @IBOutlet var LDLabel: UILabel!
    @IBOutlet var LPLabel: UILabel!

    
    
    var test : String?
    
    var theDate : NSDate?
    
    var rd : NSDate?
    var rp : String?
    var ld : NSDate?
    var lp : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        callyButton.layer.cornerRadius = 8
        callyButton.layer.masksToBounds = true
//        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = true
//        
        print(test)
        
        if test == "s"{
//            testTypeLabel.text = "SAT Test:"
            testIMGView.image = UIImage(named: "SAT LOGO")
        }else{
//            testTypeLabel.text = "ACT Test:"
            testIMGView.image = UIImage(named: "ACT Logo")
            
        }
        
        
        if rd != nil{
            let ddateFormatter = NSDateFormatter()
            ddateFormatter.dateStyle = .LongStyle
            
            let sstring = ddateFormatter.stringFromDate(rd!)
            
            print(sstring)
            self.RDLabel.text = "\(sstring)"

        }
        if rp != nil{
            RPLabel.text = "$\(rp!)"
        }
        if ld != nil{
            let ddateFormatter = NSDateFormatter()
            ddateFormatter.dateStyle = .LongStyle
            
            let string = ddateFormatter.stringFromDate(ld!)
            
            print(string)
            self.LDLabel.text = string
            

        }
        if lp != nil{
            if lp != "N/A"{
                self.LPLabel.text = "+$\(lp!)"
            }else{
                self.LPLabel.text = "N/A"
            }
        }
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        
        let string = dateFormatter.stringFromDate(theDate!)
        
        print(string)
        self.testDateLabel.text = string
        
        
        // do other data
        
        

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
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        if section == 0{
            return 3
        }else{
            return 2
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

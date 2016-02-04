//
//  aCollegeViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/22/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse


class aCollegeViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var naviItem: UINavigationItem!
    @IBOutlet var tableview: UITableView!
    
    @IBOutlet var backButton: UIBarButtonItem!
    @IBOutlet var addCollegeButton: UIBarButtonItem!
    var aCollege : String?
    
    // Transfer VARS
    var icon : UIImage?
    var beef : PFFile?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        checkup()
        
        print(beef)
        
        naviItem.backBarButtonItem?.tintColor = UIColor.whiteColor()    
        
        view.roundCorners([.BottomRight , .BottomLeft], radius: 10)
        
        //view.layer.cornerRadius = 20
//        view.layer.masksToBounds = true
        
        print(aCollege)
        
        print(icon)
        
        if aCollege != nil{
            self.title = "\(aCollege!)"
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func goBacl(sender: AnyObject) {
         print("pushed")
        // USE SEGUE IDENTIFIER
        Verify()
    }

    
    func checkup(){
        var myColleges = [String]()
        let (resultSet, err) = SD.executeQuery("SELECT * FROM myNColleges")
        // THIS IS THE EXAMPLE TO USE TO REMOVE DATA OLDER THAN ONE MONTH IN KAYCO
        if err != nil{
            
        }else{
            
            for row in resultSet{
                if let college = row["collegeName"]?.asString(){
                    print("Got into \(college) unversity")
                    myColleges.append(college)
                }
                
              
            }
            
        }
        
        if myColleges.contains(aCollege!){
            print("YES WE HAVE \(aCollege!) in our collection")
            self.addCollegeButton.image = UIImage(named: "check")
        }else{
            print("Nope don't have it.")
        }
        
    }
    
    
    
    
    
    
    @IBAction func addToMyColleges(sender: AnyObject) {
        if addCollegeButton.image != UIImage(named: "Fill 42"){
            if aCollege != nil{
                print("Removing \(aCollege)")
                
                if let err = SD.executeChange("DELETE FROM myNColleges WHERE collegeName = ?", withArgs: [aCollege!]){
                    
                }else{
                    print("LETSSSS GO")
                    print("Deleted \(aCollege!)")

                }
                
                
                
                

                
                
                addCollegeButton.image = UIImage(named: "Fill 42")
            }
        }else{
            if aCollege != nil{
             print("Starting to add \(aCollege!)")
             
             if let _ = SD.executeChange("INSERT INTO myNColleges (collegeName) VALUES (?)", withArgs: [aCollege!]){
                
             }else{
                 // added successfully
                 print("Added \(aCollege!)")
             }
                addCollegeButton.image = UIImage(named: "check")

            }
        }
    }
    
    
    
    func queryACollege(){
        let college = PFQuery(className: "Colleges")
        college.whereKey("collegeName", equalTo: aCollege!)
        college.getFirstObjectInBackgroundWithBlock { (result:PFObject?, error:NSError?) -> Void in
            if error == nil{
                if let result = result as PFObject?{
                    
                    if self.icon == nil{
                        self.beef = result["collegeIcon"] as? PFFile
                        print(self.beef)
//                        self.beef!.getDataInBackgroundWithBlock({ (theData:NSData?, error:NSError?) -> Void in
//                            let image : UIImage = UIImage(data: theData!)!
//                            self.icon = image
//                            self.tableview.reloadData()
//                            print("ran it")
//                        })
                    }
                    
                    
                }
            }
            
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : aCP1Cell = tableView.dequeueReusableCellWithIdentifier("aco1", forIndexPath: indexPath) as! aCP1Cell
        cell.cloFile = self.beef

        if self.icon != nil{
        cell.cLOGO.image = self.icon!
        }else{
            cell.cloFile = self.beef!
            cell.cloFile!.getDataInBackgroundWithBlock({ (theData:NSData?, error:NSError?) -> Void in
                let image : UIImage = UIImage(data: theData!)!
                cell.cLOGO.image = image
                print("ran it")
            })

       }
        return cell
        
    }
    
    func Verify(){
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: UITabBarController = storyboard.instantiateViewControllerWithIdentifier("homeT") as! UITabBarController
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

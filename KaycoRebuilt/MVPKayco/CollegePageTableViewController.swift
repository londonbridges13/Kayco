//
//  CollegePageTableViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/10/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class CollegePageTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    
    
        @IBOutlet var naviItem: UINavigationItem!
        @IBOutlet var tableview: UITableView!
        
        @IBOutlet var backButton: UIBarButtonItem!
        @IBOutlet var addCollegeButton: UIBarButtonItem!
        var aCollege : String?
        
        // Transfer VARS
        var icon : UIImage?
        var beef : PFFile?
    
        var ldICON : UIImage?

    
    
    
        
    //Cell1
    @IBOutlet var outTui: UILabel!
    @IBOutlet var inTui: UILabel!
    @IBOutlet var iconIMGView: UIImageView!
    @IBOutlet var locationLabel: UILabel!
    
    
    //Wiki Description Cell
    @IBOutlet var wikiLabel: UILabel!
    
    
    
    //Cell2(AddCollege)
    @IBOutlet var addCollegeBlueButton: UIButton!
    
    
    //Cell3
    @IBOutlet var AdmissionsView : UIView!
    @IBOutlet var appDeadline: UILabel!
    
    
    
    //Cell4
    @IBOutlet var theINFOArea: UIView!
    @IBOutlet var AppFeeLabel: UILabel!

    
    @IBOutlet var eaLabel: UILabel!
    @IBOutlet var eaIMGView: UIImageView!
    
    
    
    @IBOutlet var edLabel: UILabel!
    @IBOutlet var edIMGView: UIImageView!
    
    
    @IBOutlet var RaRaIMGView: UIImageView!
    
    
    
    var theState: String?
    
    
    
    //Cell5
    @IBOutlet var eventsGrayButton: UIButton!
    
    
    //CELL6
    
    @IBOutlet var inCOA: UILabel!
    @IBOutlet var outCOA: UILabel!
    

    
    // END
    var removeColor : UIColor = UIColor(red: 204/255, green: 51/255, blue: 102/255, alpha: 1)
    var addColor : UIColor = UIColor(red: 79/255, green: 153/255, blue: 237/255, alpha: 1)
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false) 

        // BLUEBUTTON
            addCollegeBlueButton.layer.cornerRadius = 8
            addCollegeBlueButton.layer.shadowOpacity = 0.6
            addCollegeBlueButton.layer.shadowColor = UIColor.blackColor().CGColor
            addCollegeBlueButton.layer.shadowOffset = CGSize(width: 0.6, height: 2)
            addCollegeBlueButton.layer.shadowRadius = 1

//        // EventsButton
//        eventsGrayButton.layer.cornerRadius = 8
//        eventsGrayButton.layer.shadowOpacity = 0.6
//        eventsGrayButton.layer.shadowColor = UIColor.blackColor().CGColor
//        eventsGrayButton.layer.shadowOffset = CGSize(width: 0.6, height: 2)
//        eventsGrayButton.layer.shadowRadius = 1
//
//        //INFOArea
//        theINFOArea.layer.cornerRadius = 8
//        theINFOArea.layer.shadowOpacity = 0.6
//        theINFOArea.layer.shadowColor = UIColor.blackColor().CGColor
//        theINFOArea.layer.shadowOffset = CGSize(width: 0.6, height: 2)
//        theINFOArea.layer.shadowRadius = 1
        print("chacha")
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            queryACollege()
            
            
//            self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica", size: 17)!]
            UINavigationBar.appearance().tintColor = UIColor.whiteColor()
            self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Arial Rounded MT Bold", size: 15)!, NSForegroundColorAttributeName : UIColor.whiteColor()]

            
            
            // EventsButton
            self.eventsGrayButton.layer.cornerRadius = 8
            self.eventsGrayButton.layer.shadowOpacity = 0.6
            self.eventsGrayButton.layer.shadowColor = UIColor.blackColor().CGColor
            self.eventsGrayButton.layer.shadowOffset = CGSize(width: 0.6, height: 2)
            self.eventsGrayButton.layer.shadowRadius = 1
            
            //INFOArea
            self.theINFOArea.layer.cornerRadius = 2
            self.theINFOArea.layer.shadowOpacity = 0.6
            self.theINFOArea.layer.shadowColor = UIColor.blackColor().CGColor
            self.theINFOArea.layer.shadowOffset = CGSize(width: 1, height: 2)
//            self.theINFOArea.layer.shadowRadius = 1
            
            //Admissions Area
            self.AdmissionsView.layer.cornerRadius = 2
            self.AdmissionsView.layer.shadowOpacity = 0.6
            self.AdmissionsView.layer.shadowColor = UIColor.blackColor().CGColor
            self.AdmissionsView.layer.shadowOffset = CGSize(width: 1, height: 2)
//            self.AdmissionsView.layer.shadowRadius = 1

            
//            queryACollege()

//            tableview.delegate = self
//            tableview.dataSource = self
            tableview.rowHeight = 170
            checkup()
            if icon != nil{
            iconIMGView.image = icon
            }
            iconIMGView.layer.shadowOpacity = 0.7
            iconIMGView.layer.shadowOffset = CGSize(width: 0, height: 2)
            
            //Wiki Label
            wikiLabel.layer.cornerRadius = 8
            
            
            print(beef)
            
            naviItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
            
       //   can't have it  view.roundCorners([.BottomRight , .BottomLeft], radius: 10)
            
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
        
    
    @IBAction func dismissVC(sender: AnyObject) {
        print("Dissmissing")
        dismissViewControllerAnimated(true, completion: nil)
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
                self.addCollegeBlueButton.setTitle("Remove College", forState: .Normal)
                self.addCollegeBlueButton.backgroundColor = self.removeColor
                
            }else{
                print("Nope don't have it.")
            }
            
        }
        
        
        
        
        
        
        @IBAction func addToMyColleges(sender: AnyObject) {
            if addCollegeButton.image != UIImage(named: "Fill 42"){
            //change above
                if aCollege != nil{
                    print("Removing \(aCollege)")
                    
                    if let err = SD.executeChange("DELETE FROM myNColleges WHERE collegeName = ?", withArgs: [aCollege!]){
                        
                    }else{
                        print("LETSSSS GO")
                        print("Deleted \(aCollege!)")
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    addCollegeButton.image = UIImage(named: "Fill 42")
                    // delete above
                    self.addCollegeBlueButton.setTitle("Add College", forState: .Normal)
                    self.addCollegeBlueButton.backgroundColor = self.addColor
                }
            }else{
                if aCollege != nil{
                    print("Starting to add \(aCollege!)")
                    
                    
                    if self.icon != nil{
                        ldICON = self.icon
                    }else{
                        ldICON = UIImage(named: "DefaultCollegeImg")
                    }
                    
                    if let _ = SD.executeChange("INSERT INTO myNColleges (collegeName, icon) VALUES (?,?)", withArgs: [aCollege!,ldICON!]){
                        
                    }else{
                        // added successfully
                        print("Added \(aCollege!)")
                        print("This is your icon img \(ldICON!)")
                    }
                    addCollegeButton.image = UIImage(named: "check")
                    //delete Above
                    self.addCollegeBlueButton.setTitle("Remove College", forState: .Normal)
                    self.addCollegeBlueButton.backgroundColor = self.removeColor
                }
            }
        }
        
        
        
        func queryACollege(){
            self.iconIMGView.image = UIImage(named: "DefaultCollegeImg")
            let college = PFQuery(className: "rere")
            college.whereKey("COLLEGES", equalTo: aCollege!)
            college.limit = 1
            college.getFirstObjectInBackgroundWithBlock { (result:PFObject?, error:NSError?) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                if error == nil{
                    if let result = result as PFObject?{
                        
                        if self.icon == nil{
                            self.beef = result["collegeIcon"] as? PFFile
                            print(self.beef)
                            if self.beef != nil{
                            self.beef!.getDataInBackgroundWithBlock({ (theData:NSData?, error:NSError?) -> Void in
                                    let image : UIImage = UIImage(data: theData!)!
                                    self.iconIMGView.image = image
                                    self.tableview.reloadData()
                                    print("ran it")
                            })
                            }
                        }
                        
                        // background piture
                        
                        let afee = result["applicationFEE"] as? String
                        let eAction = result["EarlyADate"] as? NSDate
                        let eDecision = result["EarlyDDate"] as? NSDate
                        let roAD = result["RARA"] as? String
                        let appDeadlinee = result["applyDeadlineDate"] as? NSDate
                        let inTuition = result["inTuition"] as? String
                        let outTuition = result["outTuition"] as? String
                        let inCost = result["inStateCOA"] as? String
                        let outCost = result["outStateCOA"] as? String

                        
                        if afee != nil{
                            self.AppFeeLabel.text = afee
                        }
                        
                        if eAction != nil{
                            let ddateFormatter = NSDateFormatter()
                            ddateFormatter.dateStyle = .ShortStyle
                            
                            let string = ddateFormatter.stringFromDate(eAction!)
                            
                            print(string)

                            self.eaLabel.text = string
                            
                            self.eaIMGView.image = UIImage()
                        }else{
                            self.eaLabel.text = ""

                            self.eaIMGView.image = UIImage(named: "redXx3")
                        }
                        
                        if eDecision != nil{
                            let ddateFormatter = NSDateFormatter()
                            ddateFormatter.dateStyle = .ShortStyle
                            
                            let string = ddateFormatter.stringFromDate(eDecision!)
                            
                            print(string)

                            self.edLabel.text = string

                        }else{
                            self.edLabel.text = ""

                            self.edIMGView.image = UIImage(named: "redXx3")
                        }
                        
                        if roAD != nil{
                            if roAD == "yes"{
                                self.RaRaIMGView.image = UIImage(named: "greenCheckx3")

                            }else{
                                self.RaRaIMGView.image = UIImage(named: "redXx3")
                            }
                        }
                        
                        if appDeadlinee != nil{
                            let ddateFormatter = NSDateFormatter()
                            ddateFormatter.dateStyle = .LongStyle
                            
                            let string = ddateFormatter.stringFromDate(appDeadlinee!)
                            
                            print(string)

                            self.appDeadline.text = string
                        }
                        
                        if inTuition != nil{
                            self.inTui.text = inTuition!
                        }
                        
                        if outTuition != nil{
                            self.outTui.text = outTuition!

                        }
                        
                        
                        //BUILD THIS!!!
                        if inCost != nil{
                            self.inCOA.text = inCost!

                        }
                        
                        if outCost != nil{
                            self.outCOA.text = outCost!

                        }
                        
                        let st  = result["STABBR"] as! String
                        let city = result["CITY"] as! String
                        
                        self.theState = st
                        self.locationLabel.text = "\(city), \(st)"
                    
                        let ti : SuggestedCollegesVC = self.childViewControllers.first as! SuggestedCollegesVC
                        
                        ti.theState = st
                        ti.querySuggestedColleges() 
                    }
                }
                })

            }

            self.tableview.reloadData()
        }
    
    
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
            return 1
        }

    
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 8
        }
    
    /*
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
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
    */
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "etvc"{
            let vc : eventsTableViewController = segue.destinationViewController as! eventsTableViewController
            vc.aCollege = self.aCollege!
            vc.iconIMG = self.iconIMGView.image!
        }
        if segue.identifier == "WikiD"{
            let vvc : WikiNavi = segue.destinationViewController as! WikiNavi
            
            let vc = vvc.viewControllers.first as! WikiDescriptionTVC
            
            vc.College = self.aCollege!
            if self.wikiLabel.text != nil{
                vc.CollegeDescription = self.wikiLabel.text!
            }else{
                vc.CollegeDescription = "Network Error..."
            }
//            vc.CollegeDescription = self.wikiLabel.text
            vc.collegeIcon = self.icon
        }
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

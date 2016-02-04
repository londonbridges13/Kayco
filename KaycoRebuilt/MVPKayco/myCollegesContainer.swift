//
//  myCollegesContainer.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/26/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

// pull array of mycolleges from sqlite
// set them equal to mycolleges , before the query

class myCollegesContainer: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    //    var myColleges = ["Mizzou", "St.Louis University"]//[String]()

    var myColleges = [String]()
    var myIcons = [PFFile]()
    var iconIMGS = [UIImage]()
    var fColleges = [String]()
    var hasIMG = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myIcons.removeAll()
        myColleges.removeAll()
        iconIMGS.removeAll()
        fColleges.removeAll()
        findIT()
//        queryMyColleges()
        
        collectionView.layer.cornerRadius = 5
        
        collectionView.layer.masksToBounds = true
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        
        myIcons.removeAll()
        myColleges.removeAll()
        iconIMGS.removeAll()
        fColleges.removeAll()
        findIT()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func queryMyColleges(){
        print("GO")
        let myCquery = PFQuery(className: "rere")
        print("capper")
        if self.myColleges.count == 0{
            print("Say Something")
        }else{"We Got Something"}
        myCquery.whereKey("COLLEGES", containedIn: fColleges)
        myCquery.orderByAscending("COLLEGES")
        
        myCquery.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                        print("IN")
//                        let peta = result.objectForKey("ShipIt") as! String
//                        if peta == "yes"{
                        let aCollegeName = result["COLLEGES"] as! String
                        // do images too
                        let test = result["onCTW"] as? Bool
                        
                        
                        
                        let icon = result["collegeIcon"] as? PFFile
                        
                        self.myColleges.append(aCollegeName)
                        
                        if icon != nil{
                            self.myIcons.append(icon!)
                            print(icon!)
                        }else{
                            print("theres a problem, no IMG")
                            // default img
                            let defidata = UIImageJPEGRepresentation(UIImage(named: "DefaultCollegeImg")!, 1.0)
                            let file = PFFile(data: defidata!)
                            self.myIcons.append(file!)
                            
                        }
                        
                        if test != nil{
                        print(test)
                        }else{print("No BOOL onCTW")}
                        print(aCollegeName)
                        
//                        }
                    }
                }

            }
            self.collectionView.reloadData()
            print("END")

        }
    }
    
    
    
    
    func findIT(){
        myIcons.removeAll()
        myColleges.removeAll()
        iconIMGS.removeAll()
        fColleges.removeAll()
        
        let (resultSet, err) = SD.executeQuery("SELECT * FROM myNColleges")
        // THIS IS THE EXAMPLE TO USE TO REMOVE DATA OLDER THAN ONE MONTH IN KAYCO
        if err != nil{
            
        }else{
            
            for row in resultSet{
                if let college = row["collegeName"]?.asString(){
                    print("Got into \(college) unversity")
                    self.fColleges.append(college)
                }
                
                    print(fColleges.count)

                if let ID = row["ID"]?.asInt(){
                    print("index \(ID)")
                }
 
            }
            
        }
        
            queryMyColleges()
            print("RE-DID")
        
    }

    
    
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myColleges.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : myCcell = collectionView.dequeueReusableCellWithReuseIdentifier("myCcell", forIndexPath: indexPath) as! myCcell
        
        let cName = cell.viewWithTag(1) as! UILabel
        cName.text = "\(myColleges[indexPath.row])"

        
        if (indexPath.row < myIcons.count){
            print("your good")
            let icon = myIcons[indexPath.row]
            icon.getDataInBackgroundWithBlock ({ (theData:NSData?, error:NSError?) -> Void in
                
                let image : UIImage = UIImage(data: theData!)!
                let imgview = cell.viewWithTag(2) as! UIImageView
                imgview.image = image
                self.iconIMGS.append(image)
            })

        }else{
            print("HOLY SHIT")
            self.iconIMGS.append(UIImage(named: "DefaultCollegeImg")!)
        }
        
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc : aCollegeNAVI = segue.destinationViewController as! aCollegeNAVI
        
        let cell = sender as! myCcell
        let indexPath = self.collectionView.indexPathForCell(cell)
        
//        let ti = vc.viewControllers.first as! aCollegeViewController
        let ti = vc.viewControllers.first as! CollegePageTableViewController
        

        
        ti.aCollege = "\(myColleges[indexPath!.row])"
        ti.icon = iconIMGS[indexPath!.row]
        
//        if myIcons[indexPath!.row] = {
        //ti.beef = myIcons[indexPath!.row]
        
        
        
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

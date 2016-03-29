//
//  SuggestedCollegesVC.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 11/15/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class SuggestedCollegesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var cNarray = [String]()
    var cIarray = [PFFile]()
    var AIarray = [UIImage]()
    // transfer
    var theState : String?
    
    var colleges = [CollegeObject]()
    
    @IBOutlet var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colleges.count //cNarray.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : sugCell = collectionView.dequeueReusableCellWithReuseIdentifier("sugCell", forIndexPath: indexPath) as! sugCell
        
        cell.cNameLabel.text = self.colleges[indexPath.row].name//self.cNarray[indexPath.row]
        cell.fileholder = self.colleges[indexPath.row].IconIMGFile//self.cIarray[indexPath.row]
        
        cell.fileholder?.getDataInBackgroundWithBlock({ (theData : NSData?, error:NSError?) -> Void in
            let image = UIImage(data: theData!)
            self.AIarray.append(image!)
            self.colleges[indexPath.row].Icon = image!
            cell.iconIMGView.image = image!
        })
        return cell
    }

    
    
    func querySuggestedColleges(){
        print(theState)
        
        let sugQ = PFQuery(className: "rere")
        sugQ.whereKey("STABBR", equalTo: theState!)
//        sugQ.whereKey("onCTW", equalTo: true)
        sugQ.whereKey("ShipIt", equalTo: "yes")
        sugQ.limit = 13
        sugQ.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error : NSError?) -> Void in
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                        var aCCC = CollegeObject()
                        
                        let collegeName = result["COLLEGES"] as? String
                        let iconfile = result["collegeIcon"] as? PFFile
                        
                        if collegeName != nil{
                            self.cNarray.append(collegeName!)
                            aCCC.name = collegeName!
                        }
                        if iconfile != nil{
                            aCCC.IconIMGFile = iconfile!
                            self.cIarray.append(iconfile!)
                        }else{
                            let img = UIImagePNGRepresentation(UIImage(named: "DefaultCollegeImg")!)
                            let pfile = PFFile(data: img!)
                            aCCC.IconIMGFile = pfile!
                            aCCC.Icon = UIImage(data:img!)
                            self.cIarray.append(pfile!)

                        }
                        
                        self.colleges.append(aCCC)
                        
                        self.collectionview.reloadData()

                    }
                }
            }
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "sugID"{
        let vc : aCollegeNAVI = segue.destinationViewController as! aCollegeNAVI
        
        let vcv : CollegePageTableViewController = vc.viewControllers.first as! CollegePageTableViewController
        
        let cell : sugCell = sender as! sugCell
        
        let index = collectionview.indexPathForCell(cell)!
        
        vcv.icon = self.colleges[index.row].Icon//self.AIarray[index.row]
        vcv.aCollege = self.colleges[index.row].name//cNarray[index.row]
        }
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

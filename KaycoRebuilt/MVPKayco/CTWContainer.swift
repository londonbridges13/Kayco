//
//  UpcomingContainer.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/20/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class CTWContainer: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var ctwArray : [String] = [String]()
    var iconFiles = [PFFile]()
    var iconIMGS = [UIImage]()
    
    @IBOutlet var actINDI: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        collegeQuery()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegueFromCTW(segue: UIStoryboardSegue){
        print("pushed")
        navigationController!.popViewControllerAnimated(true)
        
    }

    @IBOutlet weak var collectionView: UICollectionView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ctwArray.count   // number buddy
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : CTWCell = collectionView.dequeueReusableCellWithReuseIdentifier("ctwCell", forIndexPath: indexPath) as! CTWCell
        
        cell.layer.cornerRadius = 8.0
        cell.layer.masksToBounds = true
        
        let cName = cell.viewWithTag(1) as! UILabel
        cName.text = ctwArray[indexPath.row]
        
        let icon = iconFiles[indexPath.row]
        icon.getDataInBackgroundWithBlock ({ (theData:NSData?, error:NSError?) -> Void in
//            if error == nil{
//                print(error?.description)
//            }else{
                let image : UIImage = UIImage(data: theData!)!
                let imgview = cell.viewWithTag(2) as! UIImageView
                imgview.image = image
                self.iconIMGS.append(image)
//            }
        })
        
        
        return cell
    }
    
    func collegeQuery(){
        
        let ctwQQQ = PFQuery(className: "Colleges")
        
        ctwQQQ.limit = 11
        ctwQQQ.whereKey("onCTW", equalTo: true)
        ctwQQQ.whereKey("ShipIt", equalTo: "yes")
        ctwQQQ.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                        let collegeName = result["collegeName"] as! String
                        let icon = result["collegeIcon"] as? PFFile
                        
                        
                        self.ctwArray.append(collegeName)
                        print(collegeName)
                        
                        if icon != nil{
                            self.iconFiles.append(icon!)
                            print(icon)
                        }else{print("NO ICON")}
                        
                        
                    }
                }
            }
            self.collectionView.reloadData()
            self.actINDI.stopAnimating()
        }
        
        
    }
    
    
    
    func getIcon(){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc : aCollegeNAVI = segue.destinationViewController as! aCollegeNAVI
        
//        let ti = vc.viewControllers.first as! aCollegeViewController
        let ti = vc.viewControllers.first as! CollegePageTableViewController
        
        let cell = sender as! CTWCell
        let indexPath = self.collectionView.indexPathForCell(cell)
        
        
        
        ti.aCollege = "\(ctwArray[indexPath!.row])"
        ti.icon = self.iconIMGS[indexPath!.row]
        ti.beef = self.iconFiles[indexPath!.row]
        
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

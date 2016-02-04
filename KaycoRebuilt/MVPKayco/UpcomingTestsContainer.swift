//
//  MissedTestsContainer.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/25/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse


class UpcomingTestsContainer: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var testNamesArray = [String]()
    var testDatesArray = [NSDate]()
    var testTypeArray = [String]()
    
    var rpArray = [String]()
    var rdArray = [NSDate]()
    var lpArray = [String]()
    var ldArray = [NSDate]()

    var theDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testQuery()
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return testNamesArray.count
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : MtCell = collectionView.dequeueReusableCellWithReuseIdentifier("mtCell", forIndexPath: indexPath) as! MtCell
        
        cell.testLabel.text = "\(testNamesArray[indexPath.row])"
        
        if testTypeArray[indexPath.row] == "s"{
                cell.testImageView.image = UIImage(named: "SAT LOGO")
        }else{
                cell.testImageView.image = UIImage(named: "ACT Logo")
        }
        
        cell.layer.cornerRadius = 8.0
        cell.layer.masksToBounds = true
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        performSegueWithIdentifier("testSG", sender: UpcomingTestsContainer())

    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let cell = sender as! MtCell
//        let index = collectionView.indexPathForCell(cell)!
//        performSegueWithIdentifier("testSG", sender: UpcomingTestsContainer())


        if segue.identifier == "testSG"{
        // send to testVC, segue data over
        
        let vc: TestNavi = segue.destinationViewController as! TestNavi
        
        let ti : TestTableViewController = vc.viewControllers.first as! TestTableViewController
        
//            for item in self.collectionView!.visibleCells() as! [MtCell] {
//                let index : NSIndexPath = self.collectionView.indexPathForCell(item )!
//                var cell : MtCell = self.collectionView!.cellForItemAtIndexPath(index) as! MtCell
//            

            let cell = sender as! MtCell
            let index = collectionView.indexPathForCell(cell)!
                
        ti.test = self.testTypeArray[index.row]
        ti.theDate = self.testDatesArray[index.row]
        ti.rp = self.rpArray[index.row]
        ti.rd = self.rdArray[index.row]
        ti.lp = self.lpArray[index.row]
        ti.ld = self.ldArray[index.row]
                
                
                
//            }
        }
    }
    
    
    
    func testQuery(){
        
        let tQuery = PFQuery(className: "Tests")
        
        tQuery.whereKey("testDate", greaterThan: theDate)
        tQuery.orderByAscending("testDate")
        tQuery.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error : NSError?) -> Void in
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                        let testName = result["testName"] as! String
//                        let testDate = result["Date"] as! NSDate
                        let testType = result["testType"] as! String
                        let date = result["testDate"] as! NSDate
                        let rp = result["Price"] as! String
                        let rd = result["aDeadlineDate"] as! NSDate
                        let lp = result["latePrice"] as! String
                        let ld = result["lateDeadlineDate"] as! NSDate
                        
                        
                        print(testName)
//                        print(testDate)
                        print(testType)
                        
                        self.rdArray.append(rd)
                        self.rpArray.append(rp)
                        self.ldArray.append(ld)
                        self.lpArray.append(lp)
                        self.testDatesArray.append(date)
                        self.testNamesArray.append(testName)
//                        self.testDatesArray.append(testDate)
                        self.testTypeArray.append(testType)
                        
                        self.collectionView.reloadData()
                    }
                }
            }
            
        }
        
        //            ENDED HERE
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

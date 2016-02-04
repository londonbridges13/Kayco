//
//  ViewController.swift
//  slideshow
//
//  Created by Lyndon Samual McKay on 10/30/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse


class mSlideViewController: UIViewController, CAPSPageMenuDelegate {
    var pageMenu : CAPSPageMenu?
        var oo : Int?
    var mEventTitles : [String] = [String]()
    var icons = [PFFile]()
    var mEventPics = [PFFile]()
    
    var tNum : Int?
    
    var controllerArray : [UIViewController] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mSlideQuery()
        
        NSTimer.every(5.second) { () -> Void in
            self.ittt()
        }
        
        
        // yapper
        
        print("--------MANGO--------")
        print(oo)
    

    
        
        
        
        self.title = "PAGE MENU"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        // MARK: - Scroll menu setup
        
        // Initialize view controllers to display and place in array
        
        let controller1 = mSlide1VC()
        controller1.viewDidLoad()
        controller1.view.frame = CGRect(x: 0, y: 0, width: 320, height: 100)
        controller1.view.center = CGPointMake(0, 0)
        controller1.view.backgroundColor = UIColor.cyanColor()
        controller1.parentNavigationController = self.navigationController
        controller1.title = "FAVORITES"
        controller1.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 0
            self.performSegueWithIdentifier("justgo", sender: mSlideViewController())
        }
        controllerArray.append(controller1)
        
        let controller2 = mSlide1VC()
        controller2.view.frame = CGRect(x: 0, y: 0, width: 320, height: 300)
        controller2.title = "RECENTS"
        controller2.view.backgroundColor = UIColor.redColor()
        controller2.parentNavigationController = self.navigationController
        controller2.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 1
            self.performSegueWithIdentifier("justgo", sender: mSlideViewController())
        }
        controllerArray.append(controller2)
        
        let controller3 = mSlide1VC()
        controller3.title = "FRIENDS"
        controller3.view.backgroundColor = UIColor.blueColor()
        controller3.parentNavigationController = self.navigationController
        controller3.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 2
            self.performSegueWithIdentifier("justgo", sender: mSlideViewController())
        }
        controllerArray.append(controller3)
        
        let controller4 = mSlide1VC()
        controller4.view.backgroundColor = UIColor.purpleColor()
        controller4.title = "OTHERS"
        controller4.parentNavigationController = self.navigationController
        controller4.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 3
            self.performSegueWithIdentifier("justgo", sender: mSlideViewController())
        }
        controllerArray.append(controller4)
        
        
        let controller5 = mSlide1VC()
        controller5.view.backgroundColor = UIColor.magentaColor()
        controller5.title = "OTHERS"
        controller5.parentNavigationController = self.navigationController
        controller5.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 4
            self.performSegueWithIdentifier("justgo", sender: mSlideViewController())
        }
        controllerArray.append(controller5)
       
        
        
        
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(0.0),
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .SelectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .MenuMargin(0.0),
            .MenuHeight(0.0),
            .SelectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 0.0)!),
            .UseMenuLikeSegmentedControl(false),
            .MenuItemSeparatorRoundEdges(false),
            .SelectionIndicatorHeight(0.0),
            .MenuItemSeparatorPercentageHeight(0)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Optional delegate
        pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
        
        


    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let evc : missedEventsPage = segue.destinationViewController as! missedEventsPage
        
        let index = tNum!
        
        
        evc.eventName = "\(mEventTitles[index])"

        
        evc.view.backgroundColor = UIColor.whiteColor()
        //        evc.itNA = "p"
        //        evc.eNA = "p"
        //        evc.dNA = "p"
        
    }


    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        
        
    }
    
    func ittt(){
        
        
//        NSTimer.after(5.seconds) { () -> Void in
//            print("Working")
        
            self.oo = (self.pageMenu?.currentPageIndex)! + 1
//            print(self.oo!)
        if self.oo == 5{
            self.oo = 0
        }
//            print("proof")
            self.pageMenu?.moveToPage(self.oo!)
//            print("proof")
        
            
//        }
        
        
        }
    
    
    func moreAction(){
        
        print("mmore")
        
    }
    
    
    
    func mSlideQuery(){
        var i = 0
        let mEQuery = PFQuery(className: "Events")
        
        mEQuery.whereKey("isFeatured", equalTo: true)
        //mEQuery.whereKey("Date", lessThan: NSDate())
        mEQuery.limit = 5
        mEQuery.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            
            if error == nil{
                
                if let results = results as [PFObject]?{
                    
                    for result in results{
                        print("i under")
                        print(i)
                        
                        let eventTitle = result["eventName"] as! String
//                        let icon = result["iconIMG"] as! PFFile
//                        let eventIMG = result["picture"] as! PFFile
                        
                        
                        
//                        self.mEventTitles.append(eventTitle)
//                        self.mEventPics.append(eventIMG)
//                        self.icons.append(icon)
                        print(eventTitle)
                        print("WorksQQQ")
                        
                        let pev = self.controllerArray[i] as! mSlide1VC
                        
                        pev.it.text = eventTitle
                        
                        i += 1
                        print(i)
                        self.mEventTitles.append(eventTitle)
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    
    
    

    // Uncomment below for some navbar color animation fun using the new delegate functions
    
    func didMoveToPage(controller: UIViewController, index: Int) {
//        print("did move to page")
        // DAS IT
        
        

        
//        
//        NSTimer.after(545.seconds) { () -> Void in
//            print("Working")
//            
//            self.oo = (self.pageMenu?.currentPageIndex)! + 1
//            print(self.oo!)
//
//            print("proof")
//            self.pageMenu?.moveToPage(self.oo!)
//            print("proof")
//            
//            
//        }
//        
        
        
//        print(pageMenu?.controllerArray[1])
        
        //        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        //        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
        //
        //        if index == 1 {
        //            color = UIColor.orangeColor()
        //            navColor = color
        //        } else if index == 2 {
        //            color = UIColor.grayColor()
        //            navColor = color
        //        } else if index == 3 {
        //            color = UIColor.purpleColor()
        //            navColor = color
        //        }
        //
        //        UIView.animateWithDuration(0.5, animations: { () -> Void in
        //            self.navigationController!.navigationBar.barTintColor = navColor
        //        }) { (completed) -> Void in
        //            println("did fade")
        //        }
    }
    
    func willMoveToPage(controller: UIViewController, index: Int) {
//        print("will move to page")
        
//        NSTimer.every(5.seconds) { () -> Void in
//            print("Working")
//            
//            print("proof")
//            print("proof")
        
            
        
        //        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        //        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
        //
        //        if index == 1 {
        //            color = UIColor.orangeColor()
        //            navColor = color
        //        } else if index == 2 {
        //            color = UIColor.grayColor()
        //            navColor = color
        //        } else if index == 3 {
        //            color = UIColor.purpleColor()
        //            navColor = color
        //        }
        //        
        //        UIView.animateWithDuration(0.5, animations: { () -> Void in
        //            self.navigationController!.navigationBar.barTintColor = navColor
        //        }) { (completed) -> Void in
        //            println("did fade")
        //        }
    }
}
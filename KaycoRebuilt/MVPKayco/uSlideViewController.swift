//
//  ViewController.swift
//  slideshow
//
//  Created by Lyndon Samual McKay on 10/30/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class uSlideViewController: UIViewController, CAPSPageMenuDelegate {
    var pageMenu : CAPSPageMenu?
    
    var tNum : Int?
    
    var oo : Int?

    var send = ""
    
    var icons = [PFFile]()
    var uEventTitles : [String] = [String]()
    var uEventPics = [PFFile]()
    
    var tappedSlideIndex : Int?
    
    var controllerArray : [UIViewController] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uSlideQuery()
        
        NSTimer.every(8.second) { () -> Void in
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
        
        let controller1 = uSlide1VC()
        controller1.view.frame = CGRect(x: 0, y: 0, width: 320, height: 100)
        controller1.view.center = CGPointMake(0, 0)
        controller1.parentNavigationController = self.navigationController
        controller1.title = "FAVORITES"
        controller1.num = 0
        controller1.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 0
            self.performSegueWithIdentifier("upcomingEventsPage", sender: uSlideViewController())
        }
        controllerArray.append(controller1)
        
        let controller2 = uSlide1VC()
        controller2.view.frame = CGRect(x: 0, y: 0, width: 320, height: 300)
        controller2.title = "RECENTS"
        controller2.num = 1
        controller2.parentNavigationController = self.navigationController
        controller2.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 1
            self.performSegueWithIdentifier("upcomingEventsPage", sender: uSlideViewController())
        }
        controllerArray.append(controller2)
        
        let controller3 = uSlide1VC()
        controller3.title = "FRIENDS"
        controller3.num = 2
        controller3.parentNavigationController = self.navigationController
        controller3.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 2
            self.performSegueWithIdentifier("upcomingEventsPage", sender: uSlideViewController())
        }
        controllerArray.append(controller3)
        
        let controller4 = uSlide1VC()
        controller4.view.backgroundColor = UIColor.orangeColor()
        controller4.title = "OTHERS"
        controller4.num = 3
        controller4.parentNavigationController = self.navigationController
        controller4.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 3
            self.performSegueWithIdentifier("upcomingEventsPage", sender: uSlideViewController())
        }
        controllerArray.append(controller4)
        
        
        let controller5 = uSlide1VC()
        controller5.view.backgroundColor = UIColor.whiteColor()
        controller5.title = "OTHERS"
        controller5.num = 4
        controller5.parentNavigationController = self.navigationController
        controller5.more.addControlEvent(.TouchUpInside) { () -> () in
            print("tappededed")
            self.tNum = 4
            self.performSegueWithIdentifier("upcomingEventsPage", sender: uSlideViewController())
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
    
    
    
    func More(){
        if self.send == "go"{
            print("letsgooooo")
            let evc = EventsViewController() //change this to your class name
            evc.itNA = "p"
            evc.eNA = "p"
            evc.dNA = "p"
            
            self.presentViewController(evc, animated: true, completion: nil)

        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//  b      let evc : upcomingEventsPage = segue.destinationViewController as! upcomingEventsPage
        if segue.identifier == "upcomingEventsPage"{
        let eve = segue.destinationViewController as! UITableViewController
        
        let index = tNum!
        
//  b      evc.eventName = "\(uEventTitles[index])"

//  b      evc.view.backgroundColor = UIColor.whiteColor()
        print("okokok")
//        evc.itNA = "p"
//        evc.eNA = "p"
//        evc.dNA = "p"
        }
        
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

    
    
    
    func uSlideQuery(){
        let upEQuery = PFQuery(className: "Events")
        
        var ii = 0
      //  upEQuery.whereKey("isFeatured", equalTo: true)
        upEQuery.limit = 5
        upEQuery.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            
            if error == nil{
                
                if let results = results as [PFObject]?{
                    
                    for result in results{
                        print(ii)
                        
                        let ueventTitle = result["eventName"] as! String
//                        let icon = result["iconIMG"] as! PFFile
//                        let eventIMG = result["picture"] as! PFFile
                        
                        
                        
//                        self.mEventTitles.append(eventTitle)
//                        self.mEventPics.append(eventIMG)
//                        self.icons.append(icon)
                        print(ueventTitle)
                        print("WorksUUU")
                        
                        self.uEventTitles.append(ueventTitle)
                        
                        let pev = self.controllerArray[ii] as! uSlide1VC
                        
                        pev.it.text = ueventTitle
                        
                        ii += 1
                        print(ii)
                    }
                            print(self.uEventTitles)

                }
                
            }
            
        }
        
    }
    
    
    func moreAction(){
        
        print("moreVCC")
        
    }
    
    
    
    // Uncomment below for some navbar color animation fun using the new delegate functions
    
    func didMoveToPage(controller: UIViewController, index: Int) {
//        print("did move to page")
        // DAS IT
        
//        
//        print("proof")
//        print("proof")
        
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
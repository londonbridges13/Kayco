//
//  SecondViewController.swift
//  MVPKayco
//
//  Created by Lyndon Samual McKay on 10/18/15.
//  Copyright © 2015 Lyndon Samual McKay. All rights reserved.
//

import UIKit
import Parse

class CalendarController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var xActINDI: UIActivityIndicatorView!
    @IBOutlet var xview: UIView!
    
    var collegeIconDIC = [String: UIImage]()
    var imgo = [UIImage]()
    var pficon = [PFFile]()
    var array = [String]()
    var valueToPass : UIImage?
//    var i = 0
    
    var ro : Int?
    
    var iic : Int?

    var callyDate : String?
    
    var testDate = NSDate()
    
    var fColleges = [String]()
//
    
    var iconFiles = [PFFile]()
    var eTOi : String?
    var cNtrans = [String]()
    
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var animationFinished = true
    
    var ctoNameArray  = [String]() //["Loading..."]
    var ctoArray = [String]() //["college"]
    var eventNameArray = [String]() //["."]
    var iconsArray = [PFFile]()
    
    //Segued INFO
    var descriptionArray = [String]()
    var pictureArray = [PFFile]()
    
    
    var gDate : NSDate?
    var lDate : NSDate?    // Try BOTH
    
    
    @IBOutlet var tableview: UITableView!
    // MARK: - Life cycle
    
    
    override func viewWillAppear(animated: Bool) {
        print("BABY I'm BACK")
        findIcon()
        CallyQuery()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xview.backgroundColor = UIColor.clearColor()
        view.addSubview(xview)
        
//        findIcon()
        
        var testing : NSDate?
        
        testing = testDate.minusHours(1)
        
        print(testDate)
        print(testing!)
        print("hahahahahaUPhhahahahahahah")
        
        //Checky
        menuView.layer.cornerRadius = 5
        menuView.layer.masksToBounds = true
        
        calendarView.layer.cornerRadius = 5
        calendarView.layer.masksToBounds = true
        
        var i = 0
        while i < 1{
            print("Gooo")
            
            i = i + 1
        }
        
        self.tableview.rowHeight = 78
      //  ctoArray.append("college")
       // ctoNameArray.append("testUniversity")
       // eventNameArray.append("event")
        
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        
        monthLabel.text = CVDate(date: NSDate()).globalDescription
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(ctoNameArray.count)
        print("waitwait")
        return ctoNameArray.count
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!;
//        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! eventsTVCell;
        
//        self.valueToPass = currentCell.icon
//        performSegueWithIdentifier("ctoe", sender: self)
//
//        
        tableview.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       // let cell : eventsTVCell = tableview.dequeueReusableCellWithIdentifier("tCell", forIndexPath : indexPath) as! eventsTVCell
        
        tableView.rowHeight = 78
        
      
        switch ctoArray[indexPath.row]{
        case "college":
            let cell : eventsTVCell = tableview.dequeueReusableCellWithIdentifier("tCell", forIndexPath : indexPath) as! eventsTVCell
            
            tableView.rowHeight = 78
            let tito = ctoNameArray[indexPath.row]
            cell.ctoTitle.text = ctoNameArray[indexPath.row]
            cell.eventNameLabel.text = eventNameArray[indexPath.row]
            //      cell.iconFile = iconsArray[indexPath.row]
            
            if self.fColleges.contains(tito){
                let celliio : UIImage = self.collegeIconDIC[tito]!
                cell.iconIMG.image = celliio
                self.imgo.append(celliio)
            }
  /*
            let it = self.pficon[indexPath.row]
            it.getDataInBackgroundWithBlock({ (theData :NSData?, err:NSError?) -> Void in
                let image : UIImage = UIImage(data: theData!)!
                self.imgo.append(image)
                
                print("ran it")
                
            })
*/

            print("colleger")
            
            return cell
            
            
        default:
            let cell : eventsTVCell = tableview.dequeueReusableCellWithIdentifier("tCell", forIndexPath : indexPath) as! eventsTVCell
            print("defaulter")
            return cell
            
        }
        /*
        if ctoArray[indexPath.row] == "college"{
            let cell : eventsTVCell = tableview.dequeueReusableCellWithIdentifier("tCell", forIndexPath : indexPath) as! eventsTVCell
            
            tableView.rowHeight = 78
            print("works?")
            cell.ctoTitle.text = "\(ctoNameArray[indexPath.row])"
            cell.eventNameLabel.text = "\(eventNameArray[indexPath.row])"
      //      cell.iconFile = iconsArray[indexPath.row]
            
            
            return cell
        }*/
        
        if ctoArray[indexPath.row] == "test"{
            let cell : eventsTVCell = tableview.dequeueReusableCellWithIdentifier("tCell", forIndexPath : indexPath) as! eventsTVCell
            
            tableView.rowHeight = 78
            
            cell.ctoTitle.text = ctoNameArray[indexPath.row]
            cell.eventNameLabel.text = eventNameArray[indexPath.row]
      //      cell.iconFile = iconsArray[indexPath.row]
            
            return cell
        }
        
        if ctoArray[indexPath.row] == "other"{
            let cell : eventsTVCell = tableview.dequeueReusableCellWithIdentifier("tCell", forIndexPath : indexPath) as! eventsTVCell
            
            tableView.rowHeight = 78
            
            
            cell.ctoTitle.text = ctoNameArray[indexPath.row]
            cell.eventNameLabel.text = eventNameArray[indexPath.row]
       //     cell.iconFile = iconsArray[indexPath.row]
            
            return cell
        }
        
        
        //return cell
        
    }
    
    
    
    
    
    
    
    func findIcon(){
        self.imgo.removeAll()
        self.collegeIconDIC.removeAll()
        self.fColleges.removeAll()
        let (resultSet, err) = SD.executeQuery("SELECT * FROM myNColleges")
        if err != nil{
            
        }else{
            
            for row in resultSet{
                if let college = row["collegeName"]?.asString(){
                    print("Got into \(college) unversity")
                    self.fColleges.append(college)
                    
                    if let icon = row["icon"]?.asUIImage(){
                    print("WE GOT IT")
                        self.collegeIconDIC[college] = icon
                        print("HOLY SHI\(college), \(icon)")
                    }
                }
                

                
                
                
                print(fColleges.count)
                
                if let ID = row["ID"]?.asInt(){
                    print("index \(ID)")
                }
                
            }
            
        }

    }
    
    
    
    
    

    func getIcon(){
        
        let iQ = PFQuery(className: "rere")

//        iQ.whereKey("collegeName", equalTo: eTOi!)

        print(self.cNtrans)
        iQ.whereKey("COLLEGES", containedIn: self.fColleges)
        iQ.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
            if error == nil{
                if let results = results as [PFObject]?{
                    for result in results{
                        
                        let cIcon = result["collegeIcon"] as? PFFile
                        
                        if cIcon != nil{
                            self.pficon.append(cIcon!)
                            print("go")
                        }else{
                            print("WTFFFFFFFFFFFFFF")
                        }
                        
                        if cIcon != nil{
                            self.iconFiles.append(cIcon!)
                            print(cIcon!)
                            print("gogogo")
                        }else{
                            print("problem")
                        }
                        
                        self.tableview.reloadData()
                    }
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    func CallyQuery(){
        

//        self.imgo.removeAll()
//        self.collegeIconDIC.removeAll()
//        self.fColleges.removeAll()
//        let (resultSet, err) = SD.executeQuery("SELECT * FROM myNColleges")
//        if err != nil{
//            
//        }else{
//            
//            for row in resultSet{
//                if let college = row["collegeName"]?.asString(){
//                    print("Got into \(college) unversity")
//                    self.fColleges.append(college)
//                    
//                    if let icon = row["icon"]?.asUIImage(){
//                        print("WE GOT IT")
//                        self.collegeIconDIC[college] = icon
//                        print("HOLY SHI\(college), \(icon)")
//                    }
//                }
//                
//                
//                
//                
//                
//                print(fColleges.count)
//                
//                if let ID = row["ID"]?.asInt(){
//                    print("index \(ID)")
//                }
//                
//            }
//            
//        }

        //////    END OF findIcon()
        
        

        self.xActINDI.startAnimating()
        ctoArray.removeAll()
        ctoNameArray.removeAll()
        eventNameArray.removeAll()
        iconsArray.removeAll()
        descriptionArray.removeAll()
        
        if gDate == nil{
            print("IS NIL IS NIL CHECK IT OUT")
            let cDate = NSDate()
            gDate = cDate.day + 1
            lDate = cDate.day - 1
            
        }else{
            print(gDate)
            print(lDate)
            print("gdate/ldate above")
        }
        
        // we can go sep 6 to sep 7
        
        let eventsQuery = PFQuery(className: "Events")
        eventsQuery.whereKey("collegeName", containedIn: self.fColleges)
        eventsQuery.whereKey("Date", lessThan: gDate!)
        eventsQuery.whereKey("Date", greaterThan: lDate!)
        eventsQuery.orderByAscending("eventName")
        eventsQuery.findObjectsInBackgroundWithBlock { (results : [PFObject]?, error : NSError?) -> Void in
            
            if error == nil{
                
                if let results = results as [PFObject]?{
                    
                    for result in results{
                        let peter = result.objectForKey("typeCTO") as? String
                        print(peter!)
                        self.ctoArray.append(peter!)
                        
                        if peter == "college"{
                            let collegeName = result["collegeName"] as! String
                            let eventName = result["eventName"] as! String
                            let cdescription = result["description"] as! String
                            let icon = result["iconIMG"] as? PFFile
                            let picture = result["picture"] as? PFFile
                            
                            
                            self.ctoNameArray.append(collegeName)
                            self.eventNameArray.append(eventName)
                            self.descriptionArray.append(cdescription)
                            
                            if icon != nil{
                                self.pficon.append(icon!)
                                print("go")
                            }else{
                                print("WTFFFFFFFFFFFFFF")
                            }
                            
                            if picture == nil{
                                
                            }
                            print(collegeName)
                            print(eventName)
                            
                            self.cNtrans.append(collegeName)
                            self.getIcon()

//                            getIcon()
                            
                            
                            
                        }
                        
                        if peter == "test"{
                            let testName = result["testName"] as! String
                            let eventName = result["eventName"] as! String
                            let tdescription = result["description"] as! String
                            let icon = result["iconIMG"] as? PFFile
                            let picture = result["picture"] as? PFFile
                            
                            
                            self.ctoNameArray.append(testName)
                            self.eventNameArray.append(eventName)
                            self.descriptionArray.append(tdescription)
                            if icon == nil{
                                
                            }
                            if picture == nil{
                                
                            }
                            
                            
                            
                        }
                        
                        if peter == "other"{
                            let otherName = result["otherName"] as! String
                            let eventName = result["eventName"] as! String
                            let odescription = result["description"] as! String
                            let icon = result["iconIMG"] as? PFFile
                            let picture = result["picture"] as? PFFile
                            
                            
                            self.ctoNameArray.append(otherName)
                            self.eventNameArray.append(eventName)
                            self.descriptionArray.append(odescription)
                            if icon == nil{
                                
                            }
                            if picture == nil{
                                
                            }
                            
                        }
                        
//                        self.xview.removeFromSuperview()

                        
                        print(results.count)
                        print("wwresults.count")
                        self.tableview.reloadData()
                    }
                }
                
            }
            self.tableview.reloadData()
            self.xActINDI.stopAnimating()

        }
        self.tableview.reloadData()
//        self.xview.removeFromSuperview()

    }
    
    
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ctoe"{
        
        let lvc : EventPageTVC = segue.destinationViewController as! EventPageTVC
//        let nvc : UINavigationController  = segue.destinationViewController as! UINavigationController
        
//        let lvc = nvc.viewControllers.first as! EventsViewController
        
            let indexPath = tableview.indexPathForSelectedRow!

        
            
            let currentCell = tableview.cellForRowAtIndexPath(indexPath) as! eventsTVCell
            
            self.valueToPass = currentCell.icon
        //if
            let row = tableview.indexPathForSelectedRow!.row
        print(row)
//        let index = NSIndexPath(forRow: row, inSection: 0)
//        tableview.deselectRowAtIndexPath(index, animated: true)
//        print(ctoNameArray[0])
            
            let tito = ctoNameArray[indexPath.row]
            var binki : UIImage?
            if self.fColleges.contains(tito){
                let celliio : UIImage = self.collegeIconDIC[tito]!
                currentCell.iconIMG.image = celliio
                self.imgo.append(celliio)
                binki = celliio
            }

            
            
            lvc.itNA = "\(ctoNameArray[row])"
            lvc.eNA = "\(eventNameArray[row])"
            lvc.dNA = "\(descriptionArray[row])"
            lvc.iconIMGt = binki!
           // lvc.iconIMGt = self.imgo[row]
            
            
            /*let it = self.pficon[row]
            it.getDataInBackgroundWithBlock({ (theData :NSData?, err:NSError?) -> Void in
                let image : UIImage = UIImage(data: theData!)!
                 self.imgo.append(image)
                lvc.iconIMGt = image

                print("ran it")

            })*/
            if valueToPass != nil{
            }
            
        print(lvc.itNA)
        print(lvc.eNA)
        print(lvc.dNA)
        
        

        }
        
    }
}



// MARK: - CVCalendarViewDelegate & CVCalendarMenuViewDelegate

extension CalendarController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    
    
    
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    // MARK: Optional methods
    
    func shouldShowWeekdaysOut() -> Bool {
        return false
    }
    
    func shouldAnimateResizing() -> Bool {
        return true // Default value is true
    }
    

    func didSelectDayView(dayView: CVCalendarDayView, animationDidFinish: Bool) {
       // let date = dayView.date
//        findIcon()
        
        print("\(calendarView.presentedDate.commonDescription) is selected!")
        
        var copyCAT = calendarView.presentedDate.commonDescription
        
        var i = 0
        
        if callyDate == calendarView.presentedDate.commonDescription{
            print("HAHA QUERYS ONLY ONCE")
        }else{
            callyDate = copyCAT

            
        
        
        while i < 1{
            print("Gooo")
//start move
            // Date Conversion
        let dateString = "\(calendarView.presentedDate.commonDescription)"
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        let dateFormat: NSDate? = formatter.dateFromString(dateString)
//        self.CallyQuery()
        if let daete = dateFormat {
            // Do something with it.
            print(daete)
            
            gDate = daete.plusHours(10)
            lDate = daete.minusHours(10)
//            gDate = daete.day + 1
//            lDate = daete.day - 1
            
            print("")
            print((gDate?.monthh)!)
            print("")
            
            findIcon()
            self.CallyQuery()
            if self.view.viewWithTag(1) != nil{
                self.view.viewWithTag(1)?.hidden = true
            }
            print("\(gDate) //////// \(lDate)")

        }
//end move
            i = i + 1
            

        }
//      delete under
        
        
        }
    
    }
    
    
    
    
    func presentedDateUpdated(date: CVDate) {
        if monthLabel.text != date.globalDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .Center
            updatedMonthLabel.text = date.globalDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransformMakeTranslation(0, offset)
            updatedMonthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
            
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.monthLabel.transform = CGAffineTransformMakeScale(1, 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransformIdentity
                
                }) { _ in
                    
                    self.animationFinished = true
                    self.monthLabel.frame = updatedMonthLabel.frame
                    self.monthLabel.text = updatedMonthLabel.text
                    self.monthLabel.transform = CGAffineTransformIdentity
                    self.monthLabel.alpha = 1
                    updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    /*
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        let day = dayView.date.day
        let randomDay = Int(arc4random_uniform(31))
        if day == randomDay {
            return true
        }
        
        return false
    }
    */
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> [UIColor] {
        let day = dayView.date.day
        
        let red = CGFloat(arc4random_uniform(600) / 255)
        let green = CGFloat(arc4random_uniform(600) / 255)
        let blue = CGFloat(arc4random_uniform(600) / 255)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let numberOfDots = Int(arc4random_uniform(3) + 1)
        switch(numberOfDots) {
        case 2:
            return [color, color]
        case 3:
            return [color, color, color]
        default:
            return [color] // return 1 dot
        }
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 13
    }
    
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .Short
    }
    
}

// MARK: - CVCalendarViewDelegate
/*
extension ViewController: CVCalendarViewDelegate {
func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.bounds, shape: CVShape.Circle)
circleView.fillColor = .colorFromCode(0xCCCCCC)
return circleView
}

func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
if (dayView.isCurrentDay) {
return true
}
return false
}

func supplementaryView(viewOnDayView dayView: DayView) -> UIView {
let π = M_PI

let ringSpacing: CGFloat = 3.0
let ringInsetWidth: CGFloat = 1.0
let ringVerticalOffset: CGFloat = 1.0
var ringLayer: CAShapeLayer!
let ringLineWidth: CGFloat = 4.0
let ringLineColour: UIColor = .blueColor()

let newView = UIView(frame: dayView.bounds)

let diameter: CGFloat = (newView.bounds.width) - ringSpacing
let radius: CGFloat = diameter / 2.0

let rect = CGRectMake(newView.frame.midX-radius, newView.frame.midY-radius-ringVerticalOffset, diameter, diameter)

ringLayer = CAShapeLayer()
newView.layer.addSublayer(ringLayer)

ringLayer.fillColor = nil
ringLayer.lineWidth = ringLineWidth
ringLayer.strokeColor = ringLineColour.CGColor

let ringLineWidthInset: CGFloat = CGFloat(ringLineWidth/2.0) + ringInsetWidth
let ringRect: CGRect = CGRectInset(rect, ringLineWidthInset, ringLineWidthInset)
let centrePoint: CGPoint = CGPointMake(ringRect.midX, ringRect.midY)
let startAngle: CGFloat = CGFloat(-π/2.0)
let endAngle: CGFloat = CGFloat(π * 2.0) + startAngle
let ringPath: UIBezierPath = UIBezierPath(arcCenter: centrePoint, radius: ringRect.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)

ringLayer.path = ringPath.CGPath
ringLayer.frame = newView.layer.bounds

return newView
}

func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
if (Int(arc4random_uniform(3)) == 1) {
return true
}

return false
}
}
*/

// MARK: - CVCalendarViewAppearanceDelegate

extension CalendarController: CVCalendarViewAppearanceDelegate {
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return false
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 2
    }
}

// MARK: - IB Actions

extension CalendarController {
    @IBAction func switchChanged(sender: UISwitch) {
        if sender.on {
            calendarView.changeDaysOutShowingState(false)
            //shouldShowDaysOut = true
        } else {
            calendarView.changeDaysOutShowingState(true)
            //shouldShowDaysOut = false
        }
    }
    
    @IBAction func todayMonthView() {
        calendarView.toggleCurrentDayView()
    }
    
    /// Switch to WeekView mode.
    @IBAction func toWeekView(sender: AnyObject) {
        calendarView.changeMode(.WeekView)
    }
    
    /// Switch to MonthView mode.
    @IBAction func toMonthView(sender: AnyObject) {
        calendarView.changeMode(.MonthView)
    }
    
    @IBAction func loadPrevious(sender: AnyObject) {
        calendarView.loadPreviousView()
    }
    
    
    @IBAction func loadNext(sender: AnyObject) {
        calendarView.loadNextView()
    }
}

// MARK: - Convenience API Demo

extension CalendarController {
    func toggleMonthViewWithMonthOffset(offset: Int) {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(NSDate()) // from today
        
        components.month += offset
        
        let resultDate = calendar.dateFromComponents(components)!
        
        self.calendarView.toggleViewWithDate(resultDate)
    }
    
    func didShowNextMonthView(date: NSDate)
    {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(date) // from today
        
        print("Showing Month: \(components.month)")
    }
    
    
    func didShowPreviousMonthView(date: NSDate)
    {
        let calendar = NSCalendar.currentCalendar()
        let calendarManager = calendarView.manager
        let components = Manager.componentsForDate(date) // from today
        
        print("Showing Month: \(components.month)")
    }
}




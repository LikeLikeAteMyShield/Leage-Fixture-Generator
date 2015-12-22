//
//  BlacklistDateTableViewController.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 21/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class BlacklistDateTableViewController: UITableViewController {
    
    var dates = [BlacklistDate]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        if let savedDates = loadDates() {
            dates += savedDates
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dates.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("blacklistDateCell", forIndexPath: indexPath)

        let date = dates[indexPath.row]
        let df = NSDateFormatter()
        df.dateStyle = NSDateFormatterStyle.ShortStyle
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = df.stringFromDate(date.date)

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dates.removeAtIndex(indexPath.row)
            saveDates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func unwindToDateList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? blacklistDatePickerViewController, date = sourceViewController.date {
            print(date)
            let newIndexPath = NSIndexPath(forRow: dates.count, inSection: 0)
            dates.append(date)
            saveDates()
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    
    func saveDates() {
    
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(dates, toFile: BlacklistDate.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save dates...")
        }
    }
    
    func loadDates() -> [BlacklistDate]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(BlacklistDate.ArchiveURL.path!) as? [BlacklistDate]
    }

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

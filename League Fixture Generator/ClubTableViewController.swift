//
//  ClubTableViewController.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 21/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class ClubTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var clubs = [Club]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        if let savedClubs = loadClubs() {
            clubs += savedClubs
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
        
        return clubs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ClubTableViewCell", forIndexPath: indexPath) as! ClubTableViewCell
        let club = clubs[indexPath.row]
        
        cell.clubNameLabel.text = club.name
        
        if(club.hasJuniorTeam){
            cell.juniorImageView.image = UIImage.init(named: "junior")
        } else {
            cell.juniorImageView.image = nil
        }
        
        if(club.hasSeniorTeam){
            cell.seniorImageView.image = UIImage.init(named: "senior")
        } else {
            cell.seniorImageView.image = nil
        }
        
        cell.backgroundColor = UIColor.clearColor()

        return cell
    }
    
    @IBAction func unwindToClubList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? ClubViewController, club = sourceViewController.club {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                clubs[selectedIndexPath.row] = club
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                
            } else {
            
                let newIndexPath = NSIndexPath(forRow: clubs.count, inSection: 0)
                clubs.append(club)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            
            saveClubs()
        }
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
            clubs.removeAtIndex(indexPath.row)
            saveClubs()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail"{
            
            let clubDetailViewController = segue.destinationViewController as! ClubViewController
            
            if let selectedClubCell = sender as? ClubTableViewCell {
            
                let indexPath = tableView.indexPathForCell(selectedClubCell)
                let selectedClub = clubs[indexPath!.row]
                clubDetailViewController.club = selectedClub
            }
        }
        
        else if segue.identifier == "addClub"{
            
            print("Adding new club")
        }
    }

    // MARK: NSCoding
    
    func saveClubs() {
    
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(clubs, toFile: Club.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save clubs...")
        }
    }
    
    func loadClubs() -> [Club]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Club.ArchiveURL.path!) as? [Club]
    }
    
}

//
//  ClubViewController.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 20/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class ClubViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var clubNameTextField: UITextField!
    @IBOutlet weak var juniorTeamSwitch: UISwitch!
    @IBOutlet weak var seniorTeamSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var club: Club?
    
    // MARK: ViewController functions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        clubNameTextField.delegate = self
        
        if let club = club {
            navigationItem.title = club.name
            clubNameTextField.text = club.name
            juniorTeamSwitch.on = club.hasJuniorTeam
            seniorTeamSwitch.on = club.hasSeniorTeam
        }
        
        checkValidClubName()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    // MARK: TextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        saveButton.enabled = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        checkValidClubName()
        self.navigationItem.title = textField.text
    }
    
    func checkValidClubName() {
    
        let text = clubNameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        let isPresentingInAddClubMode = presentingViewController is UINavigationController
        
        if isPresentingInAddClubMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            let clubName = clubNameTextField.text ?? ""
            let hasJunior = juniorTeamSwitch.on
            let hasSenior = seniorTeamSwitch.on
            
            club = Club(name: clubName, hasJuniorTeam: hasJunior, hasSeniorTeam: hasSenior)
        }
    }
}

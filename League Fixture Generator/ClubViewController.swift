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
    
    var club: Club?
    
    // MARK: ViewController functions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        clubNameTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    // MARK: TextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        self.navigationItem.title = textField.text
    }
}

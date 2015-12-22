//
//  blacklistDatePickerViewController.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 22/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class blacklistDatePickerViewController: UIViewController {

    // MARK: Properties
    
    var date: BlacklistDate?
    @IBOutlet weak var blacklistDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if saveButton === sender {
            
            date = BlacklistDate(date: blacklistDatePicker.date)
        }
    }

}

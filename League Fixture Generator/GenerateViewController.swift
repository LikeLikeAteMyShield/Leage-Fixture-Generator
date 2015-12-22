//
//  GenerateViewController.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 22/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startDatePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        startDatePicker.sendAction("setHighlightsToday", to: nil, forEvent: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

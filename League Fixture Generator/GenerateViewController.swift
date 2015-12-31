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
    
    @IBAction func generateFixture(sender: UIButton) {
        
        let filename = "helloworld.pdf"
        
        let path:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory: AnyObject = path.objectAtIndex(0)
        
        let pdfPathWithFilename = documentDirectory.stringByAppendingPathComponent(filename)
        
        let textToDraw:NSString = "Junior League 2016"
        
        UIGraphicsBeginPDFContextToFile(pdfPathWithFilename, CGRectZero, nil)
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1100), nil)
        
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        let rect:CGRect = CGRectMake(0, 0, 850, 1100)
        
        let titleRect:CGRect = CGRectMake(375, 100, 200, 20)
        
        textToDraw.drawInRect(titleRect, withAttributes: nil)
        
        UIGraphicsEndPDFContext()
        
        performSegueWithIdentifier("moveToViewer", sender: self)
    }

}

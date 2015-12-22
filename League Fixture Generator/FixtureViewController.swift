//
//  FixtureViewController.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 22/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class FixtureViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var path = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //path = NSBundle.mainBundle().pathForResource("guide", ofType: "pdf")!
        let url = NSURL.fileURLWithPath(path)
        
        self.webView.loadRequest(NSURLRequest(URL: url))

        // Do any additional setup after loading the view.
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

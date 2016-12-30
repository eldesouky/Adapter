//
//  DetailedViewController.swift
//  Adapters
//
//  Created by Mahmoud Eldesouky on 8/6/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    
    @IBOutlet weak var detailedTitle: UILabel!
    var viewTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailedTitle.text = viewTitle
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

//
//  ViewController.swift
//  Adapters
//
//  Created by Mahmoud Eldesouky on 8/6/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var first: firstAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.tintColor    = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = UIColor.redColor()
        self.title = "Hamada"
        self.first = firstAdapter(tableView: self.tableView, delegate: self, dataType: .News)
        
        segmentControl.addTarget(self, action: "segmentedControlValueChanged:", forControlEvents:.TouchUpInside)

        //if segmentControl.selectedSegmentIndex == 0 {
            //first?.dataType = .News
        //}
        //else {
            //first?.dataType = .Sports

        //}
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func segmentChanged(sender: AnyObject) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            first?.dataType = .News
            print("zero")
        case 1:
            first?.dataType = .Sports
            print("one")
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


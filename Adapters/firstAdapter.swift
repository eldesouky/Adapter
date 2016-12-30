//
//  firstAdapter.swift
//  Adapters
//
//  Created by Mahmoud Eldesouky on 8/6/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit


class firstAdapter: NSObject,UITableViewDelegate, UITableViewDataSource{
    
    
    var tableView:UITableView?
    weak var delegate:UIViewController?
    var dataType: Type!{
        didSet{
            self.dataTypeDidChange()
        }
    }
    var data = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    var reusedCell = "SportsCell"
    init(tableView: UITableView, delegate: UIViewController, dataType: Type) {
        super.init()
        self.tableView = tableView
        self.delegate = delegate
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.dataType = dataType
        self.tableView?.registerNib(UINib(nibName: "SportsCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "SportsCellsss")
        self.tableView?.registerNib(UINib(nibName: "NewsCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "NewsCell")
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell!
        if dataType == .Sports{
            cell = tableView.dequeueReusableCellWithIdentifier("SportsCellsss", forIndexPath: indexPath) as! SportsCell
            (cell as! SportsCell).title.text = data[indexPath.row]

        }
        else {
            cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! NewsCell
            (cell as! NewsCell).title.text = data[indexPath.row]
        }
        
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controller = DetailedViewController(nibName: "DetailedViewController", bundle: nil)
        self.delegate!.navigationController?.pushViewController(controller, animated: true)
        controller.viewTitle = data[indexPath.item]

    }
    
    
    func dataTypeDidChange(){
        switch (self.dataType as Type) {
        case .News:
            data = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
        case .Sports:
            data = ["Nine","Ten","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
        default:
            break
        }
        tableView?.reloadData()
    }
    
}
enum Type {
    case News
    case Sports
    case Weather
}
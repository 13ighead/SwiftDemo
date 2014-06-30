//
//  ViewController.swift
//  Demo
//
//  Created by BigHead on 14-6-16.
//  Copyright (c) 2014年 BigHead. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
                            
    @IBOutlet var categoryTableView : UITableView
    var data = String[]()
    
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data = ["test1", "test2", "test3"]
        categoryTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
	{
		return data.count
	}
	
	func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
	{
		var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell
		cell.textLabel.text = data[indexPath.row]
		return cell
	}
}


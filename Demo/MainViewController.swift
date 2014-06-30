//
//  ViewController.swift
//  Demo
//
//  Created by BigHead on 14-6-16.
//  Copyright (c) 2014年 BigHead. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet var categoryBtn: UIBarButtonItem
    @IBOutlet var tableView : UITableView
    
    var data = Dictionary<String, String>[]()
    
    let cellIdentifier = "MainCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist")
        let pData = NSMutableArray(contentsOfFile: path)
        for i : AnyObject in pData {
            var itemdata = [
                "backgroundImage": i["image"] as String,
                "title": i["title"] as String,
                "subtitle": i["subtitle"] as String
            ]
            data.append(itemdata)
        }
//        不知道为啥这句话如果执行的话 等到复用cell的时候会出错，感觉是cell初始化的问题
//        tableView.registerClass(MainCell.self, forCellReuseIdentifier: cellIdentifier)
        categoryBtn.action = "setOffset"
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
		var cell: MainCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as MainCell

		cell.titleLabel.text = data[indexPath.row]["title"]
		cell.subtitleLabel.text = data[indexPath.row]["subtitle"]
        cell.backgroundImage.image = UIImage(named: data[indexPath.row]["backgroundImage"])
		return cell
	}
    
    func viewMoveTo(offset: CGFloat) {
         UIView.beginAnimations(nil, context: nil)
         UIView.setAnimationCurve(.EaseIn)
         if (view.frame.origin.x != offset) {
             view.frame.origin.x = offset
         }
         UIView.commitAnimations()
    }
    
    func setOffset() {
        viewMoveTo(ViewOffset)
        changeCategoryBtnAction("resetOffset")
    }
    
    func resetOffset() {
        viewMoveTo(0)
        changeCategoryBtnAction("setOffset")
    }
    
    func changeCategoryBtnAction(funcName: String) {
        categoryBtn.action = Selector(funcName)
    }
}


//
//  ViewController.swift
//  Demo
//
//  Created by BigHead on 14-6-16.
//  Copyright (c) 2014年 BigHead. All rights reserved.
//

import UIKit

let ViewOffset: CGFloat = 200.0

class ViewController: UIViewController {

    var mainViewController: MainViewController!
    
    var slideViewController: SlideViewController!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        
        mainViewController = storyBoard.instantiateViewControllerWithIdentifier("MainViewController") as MainViewController
        addChildViewController(mainViewController)
        
        mainViewController.view.frame = view.bounds
        view.addSubview(mainViewController.view)
        
        mainViewController.view.layer.masksToBounds = false
        mainViewController.view.layer.shadowColor = UIColor.blackColor().CGColor
        mainViewController.view.layer.shadowOpacity = 1.0
        mainViewController.view.layer.shadowOffset = CGSizeMake(2, 2)
        mainViewController.view.layer.shadowRadius = 15
        
        slideViewController = storyBoard.instantiateViewControllerWithIdentifier("SlideViewController") as SlideViewController
        slideViewController.view.frame = view.bounds
        view.addSubview(slideViewController.view)
        
        view.bringSubviewToFront(mainViewController.view)
        
        
        //右滑
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "dealSwipeGesture:")
        swipeRight.direction = .Right
        mainViewController.view.addGestureRecognizer(swipeRight)
    
        //左滑
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "dealSwipeGesture:")
        swipeLeft.direction = .Left
        mainViewController.view.addGestureRecognizer(swipeLeft)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dealSwipeGesture(swipeGestureRecognizer: UISwipeGestureRecognizer) {
        switch(swipeGestureRecognizer.direction){
            case UISwipeGestureRecognizerDirection.Right:
                mainViewController.setOffset()
            case UISwipeGestureRecognizerDirection.Left:
                mainViewController.resetOffset()
            default:
                break
        
        }
    }
}


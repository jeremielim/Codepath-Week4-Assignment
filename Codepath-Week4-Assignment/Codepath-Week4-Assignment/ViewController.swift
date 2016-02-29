//
//  ViewController.swift
//  Codepath-Week4-Assignment
//
//  Created by Jeremie Lim on 2/28/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // access the main Storyboard through code
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        // assign views from the storyboard into the view
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        // Assing all view controllers in an array
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        
        // Set initial tab
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
         buttons[previousIndex].selected = false
        
        // Remove the Previous ViewController and Set Button State.
        
        let previousVC = viewControllers[previousIndex]

        // Remove previous view controllers
        // MARK: Why does this happen?
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        
        // Add the New ViewController and Set Button State.
        sender.selected = true
        
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        
        // Adjust the size of the ViewController view you are adding to match
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        // Call the viewDidAppear method of the ViewController you are adding
        vc.didMoveToParentViewController(self)
    }
    


}


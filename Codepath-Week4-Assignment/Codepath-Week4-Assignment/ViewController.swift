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
    var fadeTransition: FadeTransition!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.3
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
        
        // Append subview to main content
        contentView.addSubview(vc.view)
        
        // Call the viewDidAppear method of the ViewController you are adding
        vc.didMoveToParentViewController(self)
    }
    


}


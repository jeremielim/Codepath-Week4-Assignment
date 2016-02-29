//
//  ComposeViewController.swift
//  Codepath-Week4-Assignment
//
//  Created by Jeremie Lim on 2/28/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var buttons: [UIButton]!
    var buttonsOriginY: [CGFloat]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 53.0/255.0, green: 66.0/255.0, blue: 84.0/255.0, alpha: 0.8)
        
        buttons = [
            textButton,
            photoButton,
            quoteButton,
            linkButton,
            chatButton,
            videoButton
        ]
        
        buttonsOriginY = [
            buttons[0].center.y,
            buttons[1].center.y,
            buttons[2].center.y,
            buttons[3].center.y,
            buttons[4].center.y,
            buttons[5].center.y
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        for button in buttons {
            button.center.y += 568
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        var index = 0
        
        for button in self.buttons {
            UIView.animateWithDuration(0.3, delay: Double(index)/16, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                button.center.y = self.buttonsOriginY[index]
                }, completion: nil)
            
            index++
        }
    }
    
    func closeModal() {
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    func closeIconAnimate(closure: () -> ()) {
        var index = 0
        
        
        for button in self.buttons {
            UIView.animateWithDuration(0.3, delay: Double(index)/16, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                button.center.y -= 568
                
                }, completion: nil)
            
            index++
        }
        closure()
    }
    
    @IBAction func nevermindButton(sender: AnyObject) {
        closeIconAnimate(closeModal)
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

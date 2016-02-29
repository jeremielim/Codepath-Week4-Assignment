//
//  SearchViewController.swift
//  Codepath-Week4-Assignment
//
//  Created by Jeremie Lim on 2/28/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchFeed: UIImageView!
    
    var loadImagesBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        loadImagesBackground = UIView()
        
        loadImagesBackground.frame = CGRect(x: 0, y: 0, width: 320, height: 524)
        
        loadImagesBackground.backgroundColor = UIColor(red: 53.0/255.0, green: 66.0/255.0, blue: 84.0/255.0, alpha: 1)
        view.addSubview(loadImagesBackground)
        
        var loadImages: [UIImage] = []
        
        let loader: UIImageView = UIImageView()
        loader.frame = CGRect(x: 128, y: 274, width: 61, height: 19)
        
        for index in 1...3 {
            loadImages.append(UIImage(named: "loading-\(index)")!)
        }
        
        loader.animationImages = loadImages
        loader.animationDuration = 0.3
        loader.startAnimating()
        loadImagesBackground.addSubview(loader)
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(1) { () -> () in
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.loadImagesBackground.alpha = 0
                self.searchFeed.alpha = 1
            })
        }
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

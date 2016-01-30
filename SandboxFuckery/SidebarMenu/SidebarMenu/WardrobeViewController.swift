//
//  PhotoViewController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class WardrobeViewController: UIViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!

    let myManager = OutfitManager();
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addController = segue.sourceViewController as! AddNewViewController
            if let newItem = addController.newItem {
                myManager.wardrobe += [newItem]
                myManager.save()
//                let indexPath = NSIndexPath(forRow: myManager.wardrobe.count - 1, inSection: 0)
//                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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

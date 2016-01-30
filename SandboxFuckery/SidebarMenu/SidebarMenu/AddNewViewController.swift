//
//  AddNewViewController.swift
//  SidebarMenu
//
//  Created by Max Maurin on 1/29/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController  {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    var newItem: Clothing?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            //            if let name = textField.text {
            //                if !name.isEmpty {
            //                    newItem = Clothing(name: name)
            //                }
            //            }
        }
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
    


}

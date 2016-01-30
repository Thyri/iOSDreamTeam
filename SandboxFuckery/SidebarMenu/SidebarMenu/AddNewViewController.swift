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
    
    @IBOutlet weak var casualBool: UILabel!
    @IBOutlet weak var PartyBool: UILabel!
    @IBOutlet weak var interviewBool: UILabel!
    @IBOutlet weak var addANewLabel: UILabel!
    @IBOutlet weak var segmentedTypePicker: UISegmentedControl!
    
    
    
    
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
    
    @IBAction func selectType(sender: AnyObject) {
        switch segmentedTypePicker.selectedSegmentIndex
        {
        case 0:
            addANewLabel.text = "First selected";
        case 1:
            addANewLabel.text = "Second Segment selected";
        case 2:
            addANewLabel.text = "Third Segment is on";
        case 3:
            addANewLabel.text = "Fourth Seg Yo";
        default:
            break; 
        }
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

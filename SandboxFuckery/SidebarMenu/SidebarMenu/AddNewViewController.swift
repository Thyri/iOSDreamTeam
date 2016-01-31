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
    
    @IBOutlet weak var casual: UISwitch!
    @IBOutlet weak var interview: UISwitch!
    @IBOutlet weak var party: UISwitch!
    @IBOutlet weak var addANewLabel: UILabel!
    @IBOutlet weak var segmentedTypePicker: UISegmentedControl!
    
    enum ClothingType {
        case Top
        case Bottom
        case Outerwear
        case Footwear
    }
    
    enum TopType {
        case Tank
        case Tee
        case Long
        case Dress
    }
    
    enum BottomType {
        case Shorts
        case Pants
        case Skirt
        case Tights
    }
    
    var type = ClothingType.Outerwear
    
    var newItem: Clothing?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            switch type{
            
            case .Top:
                newItem = Top(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            
            case .Bottom:
                newItem = Bottom(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            
            case .Footwear:
                newItem = Footwear(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
                
            case .Outerwear:
                newItem = Outerwear(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            
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
    
    @IBAction func selectType(sender: AnyObject) {
        switch segmentedTypePicker.selectedSegmentIndex
        {
        case 0:
            addANewLabel.text = "Coat"
            type = .Outerwear
        case 1:
            addANewLabel.text = "Shirt"
            type = .Top
        case 2:
            addANewLabel.text = "Pants"
            type = .Bottom
        case 3:
            addANewLabel.text = "Shoes"
            type = .Footwear
        default:
            addANewLabel.text = "Coat"
            type = .Outerwear
        }
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

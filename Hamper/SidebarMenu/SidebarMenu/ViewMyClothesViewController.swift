//
//  ViewMyClothesViewController
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class ViewMyClothesViewController: UITableViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!

    let myManager = OutfitManager()
    
//    func allClothes() -> [Clothing] {
//        var allClothes = [Clothing]()
//        for t in myManager.tops {
//            allClothes += [t];
//        }
//        for b in myManager.bottoms {
//            allClothes += [b];
//        }
//        for f in myManager.footwear {
//            allClothes += [f];
//        }
//        for o in myManager.bottoms {
//            allClothes += [o];
//        }
//        return allClothes
//    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddNewViewController
            if let newItem = addVC.newItem {
//                let type = addVC.type
                
                
//                switch type{
//                case .Top:
//                    myManager.tops += [newItem as! Top]
//                case .Bottom:
//                    myManager.bottoms += [newItem as! Bottom]
//                case .Footwear:
//                    myManager.footwear += [newItem as! Footwear]
//                case .Outerwear:
//                    myManager.outerwear += [newItem as! Outerwear]
//                }
                myManager.tops += [newItem as! Top]
                myManager.save()
                let indexPath = NSIndexPath(forRow: myManager.tops.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
            
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.tops.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        let item = myManager.tops[indexPath.row]
        cell.textLabel?.text = item.label
        return cell
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

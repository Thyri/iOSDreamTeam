//
//  AddNewViewController.swift
//  SidebarMenu
//
//  Created by Max Maurin on 1/29/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var colorCollection: UICollectionView!
    let colorChoices = [0xE74C3C, 0xC0392B, 0xD35400, 0xE67E22, 0xF1C40F, 0x2ECC71, 0x27AE60, 0x1ABC9C, 0x16A085, 0x3498D8, 0x2980B9, 0x32295E, 0x2C3E50, 0x9B59B6, 0x8E44AD, 0x252525, 0xBDC3C7, 0xEBEBEB]
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
        colorCollection.backgroundColor = UIColor.whiteColor()
        colorCollection.dataSource = self
        colorCollection.delegate = self
        colorCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
                
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        let currentColor = UInt(colorChoices[indexPath.row])
        cell.backgroundColor = UIColorFromRGB(currentColor)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        let currentColor = UInt(colorChoices[indexPath.row])
        colorCollection.backgroundColor = UIColorFromRGB(currentColor)
        //cell?.backgroundColor = UIColorFromRGB(0xE74c3c)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorChoices.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

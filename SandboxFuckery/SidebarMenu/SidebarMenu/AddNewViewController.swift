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
    @IBOutlet weak var articleCollection: UICollectionView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    
    let colorChoices = [0xE74C3C, 0xC0392B, 0xD35400, 0xE67E22, 0xF1C40F, 0x2ECC71, 0x27AE60, 0x1ABC9C, 0x16A085, 0x3498D8, 0x2980B9, 0x32295E, 0x2C3E50, 0x9B59B6, 0x8E44AD, 0x252525, 0xBDC3C7, 0xEBEBEB]
    let articleChoices: [UIImage] = [UIImage(named: "tag")!, UIImage(named: "Shirt-100")!, UIImage(named: "Pants-100")!, UIImage(named: "Shoes-100")!, UIImage(named: "Shirt-100")!, UIImage(named: "Pants-100")!, UIImage(named: "Shoes-100")!, UIImage(named: "Shirt-100")!, UIImage(named: "Pants-100")!, UIImage(named: "Shoes-100")!, UIImage(named: "Shirt-100")!, UIImage(named: "Pants-100")!, UIImage(named: "Shoes-100")!, UIImage(named: "Shirt-100")!, UIImage(named: "Pants-100")!]
    
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
        colorCollection.backgroundColor = UIColor.whiteColor()
        colorCollection.dataSource = self
        colorCollection.delegate = self
        colorCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCell")
        
        articleCollection.backgroundColor = UIColor.whiteColor()
        articleCollection.dataSource = self
        articleCollection.delegate = self
        articleCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "ArticleCell")
        
        
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
        var cell = UICollectionViewCell()
        
        if collectionView == colorCollection{
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ColorCell", forIndexPath: indexPath)
            let currentColor = UInt(colorChoices[indexPath.row])
            cell.backgroundColor = UIColorFromRGB(currentColor)
            
        } else if collectionView == articleCollection {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ArticleCell", forIndexPath: indexPath)
            //imageTile.image = articleChoices[indexPath.row]
            let imageTile = UIImageView()
            cell.addSubview(imageTile)
            imageTile.image = articleChoices[indexPath.row]
            cell.backgroundColor = UIColor.blueColor()
            
            
        } else {
            assertionFailure("collectionview cellforindex not exhaustive")
            
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var cell = UICollectionViewCell()
        if collectionView == colorCollection{
            let cell = collectionView.cellForItemAtIndexPath(indexPath)
            let currentColor = UInt(colorChoices[indexPath.row])
            mainImage.backgroundColor = UIColorFromRGB(currentColor)
        } else if collectionView == articleCollection {
            let cell = collectionView.cellForItemAtIndexPath(indexPath)
            mainImage.image = articleChoices[indexPath.row]
        } else {
            assertionFailure("collectionview cellforindex not exhaustive")
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var countValue = 0
        if collectionView == colorCollection{
            countValue = colorChoices.count
            
        } else if collectionView == articleCollection {
            countValue = articleChoices.count
        } else {
            assertionFailure("collectionview cellforindex not exhaustive")
            
        }
        return countValue
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

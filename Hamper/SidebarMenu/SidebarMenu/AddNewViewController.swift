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
    
    @IBOutlet weak var occasionCollection: UICollectionView!
    let colorChoices = [0xE74C3C, 0xC0392B, 0xD35400, 0xE67E22, 0xF1C40F, 0x2ECC71, 0x27AE60, 0x1ABC9C, 0x16A085, 0x3498D8, 0x2980B9, 0x32295E, 0x2C3E50, 0x9B59B6, 0x8E44AD, 0x252525, 0xBDC3C7, 0xEBEBEB]
    let articleChoices: [UIImage] = [UIImage(named: "Shirt-100")!, UIImage(named: "Pants-100")!, UIImage(named: "Shoes-100")!]
    let labelChoices: [String] = ["Shirt", "Pants", "Shoes"]
    let occasionChoices: [String] = ["Casual", "Party", "Interview"]
    let seasonChoices: [String] = ["Winter", "Spring", "Summer", "Autumn"]
    
    @IBOutlet weak var clothingLabel: UITextField!
    
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
    }
    
    enum BottomType {
        case Shorts
        case Pants
        case Skirt
    }
    
    enum FootwearType {
        case Sneakers
        case Heels
        case Loafers
        case Boots
    }
    
    var type = ClothingType.Top
    
    var newItem: Clothing?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = clothingLabel.text {
                if !name.isEmpty {
                    newItem = Top(color: 0, label: name, minTemp: 0, maxTemp: 100, casual: true, interview: true, party: true)
                }
            }
            
            //            switch type{
            //
            //            case .Top:
            //                newItem = Top(color: 0, label: "Favorite T Shirt", minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            //
            //            case .Bottom:
            //                newItem = Bottom(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            //
            //            case .Footwear:
            //                newItem = Footwear(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            //
            //            case .Outerwear:
            //                newItem = Outerwear(color: 0, label: addANewLabel.text!, minTemp: 0, maxTemp: 100, casual: casual.on, interview: interview.on, party: party.on)
            //
            //            }
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
        articleCollection!.registerNib(UINib(nibName: "ArticleCell", bundle: nil), forCellWithReuseIdentifier: "ArticleCell")
        
        mainImage.image = articleChoices[0]
        
//        occasionCollection.backgroundColor = UIColor.whiteColor()
//        occasionCollection.dataSource = self
//        occasionCollection.delegate = self
//        occasionCollection.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "OccasionCell")

        
        
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
            (cell as! ArticleCell).imageView.image = articleChoices[indexPath.row]
            (cell as! ArticleCell).textLabel.text = labelChoices[indexPath.row]
        } else if collectionView == occasionCollection {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("Occasion", forIndexPath: indexPath)
//            cell.textLabel = occasionChoices[indexPath.row]
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
        } else if collectionView == occasionCollection {
//            let cell = collectionView.cellForItemAtIndexPath(indexPath)
//            mainImage.image = articleChoices[indexPath.row]
        }else {
            assertionFailure("collectionview cellforindex not exhaustive")
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var countValue = 0
        if collectionView == colorCollection{
            countValue = colorChoices.count
        } else if collectionView == articleCollection {
            countValue = articleChoices.count
        } else if collectionView == occasionCollection {
            countValue = occasionChoices.count
        } else {
            assertionFailure("collectionview cellforindex not exhaustive")
            
        }
        return countValue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}

//
//  Outfit.swift
//  Hamper
//
//  Created by Courtney McGorrill on 1/29/16.
//  Copyright © 2016 Courtney McGorrill. All rights reserved.
//

import Foundation

class OutfitManager {
    
    var pastOutfits = [Outfit]()
    
    var wardrobe = [Clothing]()
    var tops = [Top]()
    var bottoms = [Bottom]()
    var footwear = [Footwear]()
    var outerwear = [Outerwear]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/Wardrobe"
        }
        assertionFailure("Could not determine where to store file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(wardrobe, toFile: theArchivePath) {
                print("Saved wardrobe successfully.")
            } else {
                assertionFailure("Could not save file.")
            }
        }
    }
    
    init () {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Clothing]
            }
        }
    }
    
    func generateOptions() -> [Outfit]?{
        
        
        return nil
    }

}


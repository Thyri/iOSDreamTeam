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
    var todaysOutfits = [Outfit]()

    var tops = [Clothing]()
    var bottoms = [Clothing]()
    var footwear = [Clothing]()
    var outerwear = [Clothing]()
    
    enum Occasion {
        case Casual
        case Party
        case Interview
    }
    
    let setOccasion = Occasion.Casual
    
    func archivePath(name: String) -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + name
        }
        assertionFailure("Could not determine where to store file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath("tops") {
            if NSKeyedArchiver.archiveRootObject(tops, toFile: theArchivePath) {
                print("Saved tops successfully.")
            } else {
                assertionFailure("Could not save tops file.")
            }
        }
        if let theArchivePath = archivePath("bottom") {
            if NSKeyedArchiver.archiveRootObject(bottoms, toFile: theArchivePath) {
                print("Saved bottoms successfully.")
            } else {
                assertionFailure("Could not save bottoms file.")
            }
        }
        if let theArchivePath = archivePath("footwear") {
            if NSKeyedArchiver.archiveRootObject(tops, toFile: theArchivePath) {
                print("Saved footwear successfully.")
            } else {
                assertionFailure("Could not save footwear file.")
            }
        }
        if let theArchivePath = archivePath("outerwear") {
            if NSKeyedArchiver.archiveRootObject(bottoms, toFile: theArchivePath) {
                print("Saved outerwear successfully.")
            } else {
                assertionFailure("Could not save outerwear file.")
            }
        }
    }
    
    init () {
        if let theArchivePath = archivePath("tops") {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                tops = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Clothing]
            }
        }
        if let theArchivePath = archivePath("bottoms") {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                bottoms = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Clothing]
            }
        }
        if let theArchivePath = archivePath("footwear") {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                footwear = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Clothing]
            }
        }
        if let theArchivePath = archivePath("outerwear") {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                outerwear = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Clothing]
            }
        }
    }
    
    func generateOptions(temp: Int){
        generateFromAllTypes()
    }
    
    func generateFromAllTypes(){
        for t in tops {
            for b in bottoms {
                for f in footwear {
                    for o in outerwear {
                        switch setOccasion {
                        case .Casual:
                            if t.casual && b.casual && f.casual && o.casual{
                                todaysOutfits += [Outfit(top: t, bottom: b, footwear: f, outerwear: nil)]
                            }
                        case .Party:
                            if t.party && b.party && f.party && o.party{
                                todaysOutfits += [Outfit(top: t, bottom: b, footwear: f, outerwear: nil)]
                            }
                        case .Interview:
                            if t.interview && b.interview && f.interview && o.interview{
                                todaysOutfits += [Outfit(top: t, bottom: b, footwear: f, outerwear: nil)]
                            }
                        }
                    }
                }
            }
        }
    }
}

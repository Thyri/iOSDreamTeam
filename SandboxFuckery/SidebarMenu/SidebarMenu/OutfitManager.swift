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

    var tops = [Top]()
    var bottoms = [Bottom]()
    var footwear = [Footwear]()
    var outerwear = [Outerwear]()
    
    enum Occasion {
        case Casual
        case Party
        case Interview
    }
    
    let setOccasion = Occasion.Casual
    
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
            if NSKeyedArchiver.archiveRootObject(tops, toFile: theArchivePath) {
                print("Saved wardrobe successfully.")
            } else {
                assertionFailure("Could not save file.")
            }
        }
    }
    
    init () {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                tops = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Top]
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

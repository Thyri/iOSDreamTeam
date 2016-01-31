//
//  Clothing.swift
//  Hamper
//
//  Created by Courtney McGorrill on 1/29/16.
//  Copyright © 2016 Courtney McGorrill. All rights reserved.
//

import Foundation

class Clothing: NSObject, NSCoding  {
    let label: String
    var color, minTemp, maxTemp: Int
    var casual: Bool
    var interview: Bool
    var party: Bool
    
    let labelKey = "label"
    let colorKey = "color"
    let minTempKey = "minTemp"
    let maxTempKey = "maxTemp"
    let casualKey = "casual"
    let partyKey = "party"
    let interviewKey = "interview"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(label, forKey: labelKey)
        aCoder.encodeObject(color, forKey: colorKey)
        aCoder.encodeObject(minTemp, forKey: minTempKey)
        aCoder.encodeObject(maxTemp, forKey: maxTempKey)
        aCoder.encodeObject(casual, forKey: casualKey)
        aCoder.encodeObject(party, forKey: partyKey)
        aCoder.encodeObject(interview, forKey: interviewKey)
    }
    
    required init?(coder aDecoder: NSCoder){
        label = aDecoder.decodeObjectForKey(labelKey) as! String
        color = aDecoder.decodeObjectForKey(colorKey) as! Int
        minTemp = aDecoder.decodeObjectForKey(minTempKey) as! Int
        maxTemp = aDecoder.decodeObjectForKey(maxTempKey) as! Int
        casual = aDecoder.decodeObjectForKey(casualKey) as! Bool
        party = aDecoder.decodeObjectForKey(partyKey) as! Bool
        interview = aDecoder.decodeObjectForKey(interviewKey) as! Bool
    }
    
    init(color: Int, label: String, minTemp: Int, maxTemp: Int, casual: Bool, interview: Bool, party: Bool) {
        self.color = color
        self.label = label
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.casual = casual
        self.interview = interview
        self.party = party
    }
}

//class Top: Clothing {
////    
////    var sleeves: Int
////    
////    init(color: String, label: String, minTemp: Int, maxTemp: Int, casual: Bool, interview: Bool, party: Bool, sleeves: Int) {
////        self.sleeves = sleeves
////        super.init(color: color, label: label, minTemp: minTemp,  maxTemp: maxTemp, casual: casual, interview: interview, party: party)
////    }
//}
//
//class Bottom: Clothing {
////    
////    var length: Int
////    
////    init(color: String, label: String, minTemp: Int, maxTemp: Int, casual: Bool, interview: Bool, party: Bool, length: Int) {
////        self.length = length
////        super.init(color: color, label: label, minTemp: minTemp,  maxTemp: maxTemp, casual: casual, interview: interview, party: party)
////    }
//}
//
//class Footwear: Clothing {
//    
//}
//
//class Outerwear: Clothing {
//    
//}

class Outfit {
    var top: Clothing
    var bottom: Clothing
    var footwear: Clothing
    var outerwear: Clothing?
    var blacklist: Bool
    var datesWorn: [NSDate]?
    
    init(top: Clothing, bottom: Clothing, footwear: Clothing, outerwear: Clothing?) {
        self.top = top
        self.bottom = bottom
        self.footwear = footwear
        self.outerwear = outerwear
        self.blacklist = false
    }
}

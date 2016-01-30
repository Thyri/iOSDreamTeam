//
//  Clothing.swift
//  Hamper
//
//  Created by Courtney McGorrill on 1/29/16.
//  Copyright © 2016 Courtney McGorrill. All rights reserved.
//

import Foundation

class Clothing  {
    var color, label: String
    var minTemp, maxTemp: Int
    var school: Bool
    var interview: Bool
    var party: Bool
    
    init(color: String, label: String, minTemp: Int, maxTemp: Int, school: Bool, interview: Bool, party: Bool) {
        self.color = color
        self.label = label
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.school = school
        self.interview = interview
        self.party = party
    }
}

class Top: Clothing {
    
    var sleeves: Int
    
    init(color: String, label: String, minTemp: Int, maxTemp: Int, school: Bool, interview: Bool, party: Bool, sleeves: Int) {
        self.sleeves = sleeves
        super.init(color: color, label: label, minTemp: minTemp,  maxTemp: maxTemp, school: school, interview: interview, party: party)
    }
}

class Bottom: Clothing {
    
    var length: Int
    
    init(color: String, label: String, minTemp: Int, maxTemp: Int, school: Bool, interview: Bool, party: Bool, length: Int) {
        self.length = length
        super.init(color: color, label: label, minTemp: minTemp,  maxTemp: maxTemp, school: school, interview: interview, party: party)
    }
}

class Footwear: Clothing {
    
}

class Outerwear: Clothing {
    
}

class Outfit {
    var top: Top
    var bottom: Bottom
    var footwear: Footwear
    var outerwear: Outerwear
    var blacklist: Bool
    var datesWorn: [NSDate]?
    
    init(top: Top, bottom: Bottom, footwear: Footwear, outerwear: Outerwear) {
        self.top = top
        self.bottom = bottom
        self.footwear = footwear
        self.outerwear = outerwear
        self.blacklist = false
    }
}
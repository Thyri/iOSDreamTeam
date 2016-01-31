//
//  LabelCell.swift
//  Hamper
//
//  Created by Max Maurin on 1/31/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
//
//  ArticleCell.swift
//  Hamper
//
//  Created by Max Maurin on 1/30/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

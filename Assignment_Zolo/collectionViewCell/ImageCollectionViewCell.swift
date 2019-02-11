//
//  ImageCollectionViewCell.swift
//  Assignment_Zolo
//
//  Created by Yatish on 08/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    var imageURL = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 5
    }
    
}

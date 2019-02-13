//
//  ImageCollectionViewCell.swift
//  Assignment_Zolo
//
//  Created by Yatish on 08/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell { //collection view with image
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    var imageURL = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 5
        self.layer.cornerRadius = 5
        self.mainView.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }
    
}

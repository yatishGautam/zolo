//
//  textCollectionCell.swift
//  Assignment_Zolo
//
//  Created by Yatish on 08/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import UIKit

class textCollectionCell: UICollectionViewCell { //collection view cell for collection view 1
    @IBOutlet weak var textLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
}

//
//  DetailText.swift
//  Assignment_Zolo
//
//  Created by Yatish on 08/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import Foundation
import UIKit

class detailText: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var subText1: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    
    var imageURL = URL(string: "")
    var titleText = ""
    var subText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    func intiateUIElements(){
        self.imageView.sd_setImage(with:imageURL, placeholderImage: nil)
        self.titleView.text = titleText
        self.subText1.text = subText
        returnButton.setTitle("Appriciate It", for: .normal)
    }
    
}

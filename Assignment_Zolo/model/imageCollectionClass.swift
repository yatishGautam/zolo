//
//  imageCollectionClass.swift
//  Assignment_Zolo
//
//  Created by Yatish on 11/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import Foundation

class textImageData{
    var id = 0 as Int?
    var userId = 0 as Int?
    var title = "" as String?
    var body = "" as String?
    
    init(data city: NSDictionary)
    {
        guard let textDetails = city["coordinates"] as? NSDictionary else {
            print("no coordinate in this city")
            return
        }
        self.id = textDetails["id"] as? Int
        self.userId = textDetails["userId"] as? Int
        self.title = textDetails["title"] as? String
        self.body = textDetails["body"] as? String
    }
}

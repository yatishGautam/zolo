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
    
    init(data text: NSDictionary)
    {
        self.id = text["id"] as? Int
        self.userId = text["userId"] as? Int
        self.title = text["title"] as? String
        self.body = text["body"] as? String
    }
}

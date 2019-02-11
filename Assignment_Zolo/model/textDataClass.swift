//
//  textDataClass.swift
//  Assignment_Zolo
//
//  Created by Yatish on 11/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import Foundation
import UIKit

class textData{
    var id = 0 as Int?
    var userId = 0 as Int?
    var title = "" as String?
    var completed = false as Bool?
    
    init(data text: NSDictionary) //parsing data from dicitionary
    {
        self.id = text["id"] as? Int
        self.userId = text["userId"] as? Int
        self.title = text["title"] as? String
        self.completed = text["completed"] as? Bool
    }
}


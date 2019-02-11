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
    
    init(data city: NSDictionary)
    {
        guard let textDetails = city["coordinates"] as? NSDictionary else {
            print("no coordinate in this city")
            return
        }
        self.id = textDetails["id"] as? Int
        self.userId = textDetails["userId"] as? Int
        self.title = textDetails["title"] as? String
        self.completed = textDetails["completed"] as? Bool
    }
}


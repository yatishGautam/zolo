//
//  services.swift
//  Assignment_Zolo
//
//  Created by Yatish on 11/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import Foundation
import Alamofire //3rd party library to handle networking

func getTextData(completionHandler: @escaping ( _ responseObject: AnyObject?,_ statusCode : Int?,_ error: NSError?) -> ()) {
    Alamofire.request("https://jsonplaceholder.typicode.com/todos",method: .get ,parameters:[:])
        .responseJSON {
            response in
            let statusCode:Int
            if let httpError = response.result.error {
                statusCode = httpError._code
            } else { //no errors
                statusCode = (response.response?.statusCode)!
            }
            
            if response.result.error != nil { if statusCode == -1001 || statusCode == -1005 || statusCode == -1009 {
                let  data:[String:String] = ["message": "ConnectionError" ]
                
                completionHandler(data as AnyObject  ,-1001, nil)
            } else {
                let  data:[String:String] = ["message": "ConnectionError500"]
                
                completionHandler(data as AnyObject  ,500, nil) }
            }
            
            if let JSON = response.result.value {
                print(JSON)
                completionHandler(JSON as AnyObject  ,statusCode, nil)
            }
    }
    
}



func getTextDataWithImage(completionHandler: @escaping ( _ responseObject: AnyObject?,_ statusCode : Int?,_ error: NSError?) -> ()) {
    Alamofire.request("https://jsonplaceholder.typicode.com/posts",method: .get ,parameters:[:])
        .responseJSON {
            response in
            let statusCode:Int
            if let httpError = response.result.error {
                statusCode = httpError._code
            } else { //no errors
                statusCode = (response.response?.statusCode)!
            }
            
            if response.result.error != nil { if statusCode == -1001 || statusCode == -1005 || statusCode == -1009 {
                let  data:[String:String] = ["message": "ConnectionError" ]
                
                completionHandler(data as AnyObject  ,-1001, nil)
            } else {
                let  data:[String:String] = ["message": "ConnectionError500"]
                
                completionHandler(data as AnyObject  ,500, nil) }
            }
            
            if let JSON = response.result.value {
                print(JSON)
                completionHandler(JSON as AnyObject  ,statusCode, nil)
            }
    }
    
}

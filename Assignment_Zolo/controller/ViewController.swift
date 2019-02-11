//
//  ViewController.swift
//  Assignment_Zolo
//
//  Created by Yatish on 07/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import UIKit

class firstScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func getText(){
        // get cars data
        getTextData{(response,statusCode , error) in
            if (error != nil){
               print("error")
            }else{
                // print(response!["response"]!!["serviceCities"])
                guard let responseObj = response?["response"] as? NSDictionary else {
                    print("no data recieved")
                    return
                }
                guard let cityLocationData = responseObj["serviceCities"] as? [NSDictionary] else {
                    print("no data recieved")
                    return
                }
                guard let urlArray = responseObj["banners"] as? [NSDictionary] else {
                    print("no data recieved")
                    return
                }
                if urlArray != nil{
                    var count = 0
                    for image in urlArray{
                        self.bannerURL += [bannerImage(data: image)]
                    }
                    //                        for banner in self.bannerURL{
                    //                            if banner.isActive! == 1{
                    //                            self.urlArray.append(banner.imageURL!)
                    //                            }
                    //                        }
                    self.setupScrollView(Banners: self.createBanners())
                }

            }
            //        self.dynamicFieldsData = DynamicFields(data:response!["data"] as! NSDictionary)
        }
    }


}


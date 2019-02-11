//
//  ViewController.swift
//  Assignment_Zolo
//
//  Created by Yatish on 07/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import UIKit

class firstScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var textCollectionView: UICollectionView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var recievedText : [textData] = []
    var recievedTextWithImage : [textImageData] = []
    override func viewDidLoad() {
        textCollectionView.delegate = self
        imageCollectionView.delegate = self
        getText()
        getImageText()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //mark :- collection view functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == textCollectionView{
            return recievedText.count
        }else if collectionView == imageCollectionView{
            return recievedTextWithImage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
    
    func getText(){
        // get text data
        getTextData{(response,statusCode , error) in
            if (error != nil){
                print("error")
            }else{
                guard let textDictionary = response as? [NSDictionary] else {
                    print("no data recieved")
                    return
                }
                    for text in textDictionary{
                        self.recievedText += [textData(data: text)]
                    }
                
            }
        }
    }
    
    
    func getImageText(){
        // get text data
        getTextDataWithImage{(response,statusCode , error) in
            if (error != nil){
                print("error")
            }else{
                guard let textDictionary = response as? [NSDictionary] else {
                    print("no data recieved")
                    return
                }
                    for text in textDictionary{
                        self.recievedTextWithImage += [textImageData(data: text)]
                    }

            }
        }
    }


}


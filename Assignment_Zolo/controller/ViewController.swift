//
//  ViewController.swift
//  Assignment_Zolo
//
//  Created by Yatish on 07/02/19.
//  Copyright © 2019 Yatish. All rights reserved.
//

import UIKit

class firstScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var headingView: UIView!
    @IBOutlet weak var HeadingLabel: UILabel!
    @IBOutlet weak var textCollectionView: UICollectionView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBOutlet weak var subText1: UILabel!
    @IBOutlet weak var subText2: UILabel!
    
    var recievedText : [textData] = []
    var recievedTextWithImage : [textImageData] = []
    var imageURL = URL(string: "")
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
        }else{
            return recievedTextWithImage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == textCollectionView{
            let Cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "textCollectionCell", for: indexPath) as! textCollectionCell
            Cell1.textLabel.text = recievedText[indexPath.row].title
            return Cell1
        }else{
            let Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            Cell2.titleLabel.text = recievedTextWithImage[indexPath.row].title
            Cell2.imageView.sd_setImage(with:imageURL, placeholderImage: nil)
            return Cell2
        }
    }
    //delegate function to access next screen based on the tab clicked now
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailScreen = self.storyboard?.instantiateViewController(withIdentifier: "detailText") as! detailText
        detailScreen.imageURL = self.imageURL
        detailScreen.titleText = recievedTextWithImage[indexPath.row].title!
        detailScreen.subText = recievedTextWithImage[indexPath.row].body!
        self.navigationController?.pushViewController(detailScreen, animated: false)
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
                self.textCollectionView.reloadData()
                
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
                self.imageCollectionView.reloadData()
            }
        }
    }


}


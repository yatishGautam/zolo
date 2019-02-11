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
    var imageURL = URL(string: "https://homepages.cae.wisc.edu/~ece533/images/watch.png")
    override func viewDidLoad() {
        textCollectionView.delegate = self
        imageCollectionView.delegate = self
        getText() //calling api 1
        getImageText() //calling api 2
        UIChanges() //adding text to labels
        self.textCollectionView.isPagingEnabled = true
        self.imageCollectionView.isPagingEnabled = true
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
        if collectionView == textCollectionView{ //initalising cells for collection view 1
            let Cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "textCollectionCell", for: indexPath) as! textCollectionCell
            Cell1.textLabel.text = recievedText[indexPath.row].title
            Cell1.textLabel.backgroundColor = UIColor.clear
            Cell1.layer.cornerRadius = 5
            return Cell1
        }else{ //cells for collection view 2
            let Cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            Cell2.titleLabel.text = recievedTextWithImage[indexPath.row].title
            Cell2.imageView.sd_setImage(with:imageURL, placeholderImage: nil) //using 3rd party library to render images this also handle image cacheing
            Cell2.layer.cornerRadius = 5
            
            return Cell2
        }
    }
    //delegate function to access next screen based on the tab clicked now
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == imageCollectionView{
        let detailScreen = self.storyboard?.instantiateViewController(withIdentifier: "detailText") as! detailText //making object of screen 2
        detailScreen.imageURL = self.imageURL
        detailScreen.titleText = recievedTextWithImage[indexPath.row].title!
        detailScreen.subText = recievedTextWithImage[indexPath.row].body! //initalising data
             self.present(detailScreen, animated: true, completion: nil)//showing 2nd screen
        }
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
                        self.recievedText += [textData(data: text)] //adding data 
                    }
                self.textCollectionView.reloadData()
                
            }
        }
    }
    
    
    func getImageText(){ //function to get data for collection view 2
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
                        self.recievedTextWithImage += [textImageData(data: text)] //adding data to the array of object
                    }
                self.imageCollectionView.reloadData() //refresh data
            }
        }
    }

    func UIChanges(){
        self.HeadingLabel.text = "Assignment"
        self.subText1.text  = "Text Data"
        self.subText2.text  = "Text Data with Image"
    }

}


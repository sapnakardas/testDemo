//
//  AttributeImageCollectionView.swift
//  CashFlow15
//
//  Created by jashu on 19/11/19.
//  Copyright © 2019 Flexi_Mac_4. All rights reserved.
//

import UIKit
import Photos

class AttributeImageCollectionView: UICollectionView ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
   
    //MARK: - PROPERTIES -
    var arrImages : [AssetModel] = []
     var isHideRemoveButton : Bool = false
    //MARK: - BLOCK PROPERTIES -
    var blockForDidSelectItem_Collection:((IndexPath)->Void)?
    var blockCallForCropTaped_Collection:((IndexPath)->Void)?
    var blockCallForRemoveTaped_Collection:((IndexPath)->Void)?
   
    //MARK: - INIT -
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dataSource = self
        self.delegate = self
        
        self.backgroundColor = UIColor.clear
        
        self.alwaysBounceVertical = false
        
        self.clipsToBounds = true
  
        //MARK: CELL REGISTER
        self.register(UINib(nibName: "OtherPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OtherPhotoCollectionViewCell")
    }
    
    //MARK: - COLLECTION VIEW DELEGATE AND DATA SOURCE -
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.arrImages.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherPhotoCollectionViewCell", for: indexPath) as! OtherPhotoCollectionViewCell
            
            if self.arrImages[indexPath.row].is_PDF == false
            {
               
                cell.img_OtherPhoto.image = self.arrImages[indexPath.row].image
               
                
                
                
                              
        }
        
       //cell.clipsToBounds = true
                     //cell.layer.cornerRadius = cell.frame.height/2//
          
            return cell
        
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.blockForDidSelectItem_Collection != nil{
            self.blockForDidSelectItem_Collection!(indexPath)
        }
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
   {
    return CGSize(width: 50, height:50)
   }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                     return 8
                 }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           
                     return 8
           }
 
 
   
}

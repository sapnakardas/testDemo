//
//  OtherPhotoCollectionViewCell.swift
//  CashFlow15
//
//  Created by Sanket on 18/11/19.
//  Copyright © 2019 Flexi_Mac_4. All rights reserved.
//

import UIKit

class OtherPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img_OtherPhoto: UIImageView!
   
    
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img_OtherPhoto.layer.cornerRadius = 50
        img_OtherPhoto.clipsToBounds = true
           // img_OtherPhoto.layer.borderColor =  (GlobalFunction.Instance.hexStringToUIColor(hex: "666666") as! CGColor)
           // img_OtherPhoto.layer.borderWidth = 2
        
    }
    
    //MARK:- BUTTON ACTION
   

}

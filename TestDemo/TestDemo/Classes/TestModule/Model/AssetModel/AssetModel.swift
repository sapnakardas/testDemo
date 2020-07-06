//
//  AssetModel.swift
//  VendorApp
//
//  Created by Mihin  Patel on 11/05/20.
//  Copyright © 2020 Mihin  Patel. All rights reserved.
//

import UIKit
import Photos

class AssetModel: NSObject {

    //MARK: - PROPERTIES -
    var asset : PHAsset? = nil
    var image = UIImage()
    var filedata_thumb : Data? = nil
    var imageName = ""
    var inquiryNo = ""
    var uniqueNo = ""
    var docType = ""
    var transaction_id = ""
    var uploaded_date = ""
    var is_PDF:Bool = false
    var isFront:Bool = false
    var fileURL:URL? = nil
    
    static func ==(lhs: AssetModel, rhs: AssetModel) -> Bool {
        return lhs.image == rhs.image
    }
    
    override init() {
        
    }
    
    func loadAssetObjects(with array:[PHAsset])->[AssetModel]
    {
        var tmpAssets : [AssetModel] = []
        
        for obj in array
        {
            let tmpObject = AssetModel()
            tmpObject.asset = obj
            tmpObject.image = GlobalFunction.Instance.getCustomImageData(asset: obj)
            tmpAssets.append(tmpObject)
        }
        return tmpAssets
    }
}

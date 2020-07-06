//
//  ViewController.swift
//  TestDemo
//
//  Created by Sapu on 28/06/20.
//  Copyright © 2020 Sapna. All rights reserved.
//

import UIKit
import DKImagePickerController
import Alamofire
import SwiftyJSON
class ViewController: UIViewController,DKImageAssetExporterObserver,UITextFieldDelegate {
    
    
    @IBOutlet weak var collectionOtherImages: AttributeImageCollectionView!
    //MARK:- Variable//Age of 18.
    let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
    // Age of 100.
    let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
    
       var assets: [DKAsset]?
     var arrImages : [AssetModel] = []
     var imgBtnUploadOther = UIImageView()
     
     
     deinit {
         DKImagePickerControllerResource.customLocalizationBlock = nil
         DKImagePickerControllerResource.customImageBlock = nil
         
         DKImageExtensionController.unregisterExtension(for: .camera)
         DKImageExtensionController.unregisterExtension(for: .inlineCamera)
         
         DKImageAssetExporter.sharedInstance.remove(observer: self)
     }
    
    var strGender:String?
     var ToDatePicker = UIDatePicker()
       var arrImage : [[String: Any]] = []
    //MARK:- UIoutlet
    
    @IBOutlet weak var lblfname: UILabel!
    
    @IBOutlet weak var lblLname: UILabel!
    
    @IBOutlet weak var lblemail: UILabel!
    
    
    @IBOutlet weak var lblCreatePass: UILabel!
    @IBOutlet weak var lblcode: UILabel!
    
    @IBOutlet weak var lblDOB: UILabel!
    
    @IBOutlet weak var lblPass: UILabel!
    
    @IBOutlet weak var cvPhotos: UICollectionView!
    @IBOutlet weak var txtFName: UITextField!
    
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtBirthdate: UITextField!
    
    @IBOutlet weak var txtCreatePass: UITextField!
    @IBOutlet weak var txtConPass: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var btnPlus: UIButton!
  
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        btnPlus.layer.cornerRadius = 50
        btnPlus.clipsToBounds = true
      //  btnPlus.layer.borderColor = 
        btnPlus.layer.borderWidth = 2
        
         txtFName.delegate = self
         txtLName.delegate = self
        
         txtCode.delegate = self
        
         txtPhone.delegate = self
         txtBirthdate.delegate = self
      
         txtConPass.delegate = self
        
         txtCreatePass.delegate = self
        
         txtEmailAddress.delegate = self
        strGender = "Female"
        ToDatePicker.datePickerMode = .date
                
         txtBirthdate.inputView = ToDatePicker
        
        
        
        lblfname.isHidden = true
           lblLname.isHidden = true
       lblemail.isHidden = true
      lblCreatePass.isHidden = true
         lblcode.isHidden = true
           lblDOB.isHidden = true
          lblPass.isHidden = true
    }
  
    
    //MARK:- Functions
    
    //Upload Other Images
    func updateAssets(assets: [DKAsset]) {
              print("didSelectAssets")
              self.assets = assets
    }
    
    
    func isvalid() ->Bool{
        if GlobalFunction.Instance.validateName(name:txtFName.text!) == false {
            GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please enter valid name")
            return false
        }else  if GlobalFunction.Instance.validateName(name:txtLName.text!) == false {
            
            GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please enter valid name")
            return false
        }else  if GlobalFunction.Instance.validateEmailId(emailID: txtEmailAddress.text!) == false {
            
            GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please enter valid email")
            return false
        }else if GlobalFunction.Instance.validaPhoneNumber(phoneNumber: txtPhone.text!) == false {
            GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please enter valid phone no.")
            return false
        }else if GlobalFunction.Instance.validateName(name: txtConPass.text!) == false {
            GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please enter valid  password")
            return false
        }
        else if txtConPass.text! != txtCreatePass.text {
            GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please enter valid1  password")
            return false
        }
        
        
        return true
        
    }
    func dateFormaterChanges(StrDate: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        let date: NSDate? = dateFormatterGet.date(from: StrDate) as NSDate?
        print(dateFormatterPrint.string(from: date! as Date))
        return dateFormatterPrint.string(from: date! as Date)
    }
    
    func validateAge(birthDate: Date) -> Bool {
        var isValid: Bool = true;
        if birthDate < MAXIMUM_AGE || birthDate > MINIMUM_AGE {
            isValid = false;
        }
        return isValid;
    }
    
    //MARK:- TextField Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
         
         
         if(textField == txtFName){
             lblfname.isHidden = false
        }else  if(textField == txtLName){
             lblLname.isHidden = false
            
         }else  if(textField == txtEmailAddress){
            
            
            lblemail.isHidden = false
        }else  if(textField == txtCode){
             lblcode.isHidden = false
        }else  if(textField == txtBirthdate){
            
             lblDOB.isHidden = false
        }else  if(textField == txtCreatePass){
            
            
             lblCreatePass.isHidden = false
            
         }else  if(textField == txtConPass){
            
             lblPass.isHidden = false
            
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField .resignFirstResponder()
        return true
    }
     
      func textFieldDidEndEditing(_ textField: UITextField) {
        
        
           if(textField == txtFName){
                  lblfname.isHidden = true
             }else  if(textField == txtLName){
                  lblLname.isHidden = true
                 
              }else  if(textField == txtEmailAddress){
                 
                 
                 lblemail.isHidden = true
             }else  if(textField == txtCode){
                  lblcode.isHidden = true
             }else  if(textField == txtBirthdate){
                 
                  lblDOB.isHidden = true
             }else  if(textField == txtCreatePass){
                 
                 
                  lblCreatePass.isHidden = true
                 
              }else  if(textField == txtConPass){
                 
                  lblPass.isHidden = true
                 
             }
        
              
            if(textField == txtBirthdate){
             
                  
    
                let isValidAge =  validateAge(birthDate: ToDatePicker.date)
                
                 if isValidAge == false {
                          
                           GlobalFunction.Instance.showAlertWithMessage(message: "Please enter above 18 age.", withController: self)
                       }
                 else{
                     self.txtBirthdate.text = GlobalFunction.Instance.app_StringFromDate(date: ToDatePicker.date, requiredFormate: "dd/MM/yyyy")
                }
                
        }
           }
           

   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        
        if textField == txtPhone{
            // mobile
            guard let text = txtPhone.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }else if textField == txtCode{
            // mobile
            guard let text = txtCode.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 3
    }
    return true
    }
    
    //MARK:- DatePicker
    @IBAction func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func donedatePicker(){
        self.view.endEditing(true)
    }

    //MARK:- IBAction Methods
    
    @IBAction func onTappedPlus(_ sender: Any) {
        openMultipleImagePicker()
    }
    @IBAction func onTappedFemale(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            strGender = "Female"
            
        }else {
            
            strGender = "male"
        }
        
    }
    
    
    
    @IBAction func onTappedRegiste(_ sender: Any) {
     
        
        if Connectivity.isConnectedToInternet(){

            guard let firstname = txtFName.text, let lastname = txtLName.text, let email = txtEmailAddress.text,
                let code = txtCode.text,let phone = txtPhone.text , let _ = txtConPass.text ,let creatpass =  txtCreatePass.text , let dob = txtBirthdate.text else {

                    GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please Enter all mendatory fields")

                   return
            }


            if self.isvalid() == true{



                let params : [String:String] = ["first_name":firstname , "last_name" : lastname ,  "email" : email , "code" : code , "phone_no" : phone , "password" : creatpass , "birthdate":dob , "device_type" :"I","gender" : strGender!]
                debugPrint("parameters :- ", params)
                debugPrint("URL :- ", SIGNUP)

                AlamoWebService.callWebService(strUrl: SIGNUP,withParameters: params, httpMethod: .post, withSuccessHandler: {[weak self] (dicResponseWithSuccess) in

                    if let weakSelf = self {
                        if  let response = dicResponseWithSuccess{
                            print(response)
                            //  weakSelf.arrCardList.removeAll()

                         
                        

                             if let resMSG = response["message"] as? String{
                                self!.photoUpload(images: self!.arrImage)
                               GlobalFunction.Instance.showAlertWithMessage(message:resMSG, withController: weakSelf)
                            }
                            }else {
                            GlobalFunction.Instance.showAlertWithMessage(message:V_INVALID_RESPONSE, withController: weakSelf)
                        }
                    }
                    }, withErrorHandler: { (errorMsg) in

                        GlobalFunction.Instance.showAlertWithMessage(message: errorMsg ?? "Please try again", withController: self)
                })
            }
            else {

                GlobalFunction.Instance.showAlertWithMessage(message:"Please Enter Valid field", withController: self)
            }


        }else {

            GlobalFunction.Instance.showAlertWithMessage(message:"Please try again", withController: self)
        }
//
    }
    
    
    //MARK:- Webservice
    
    //Upload Other Images
    func openMultipleImagePicker() {
        
        let pickerController = DKImagePickerController()
        pickerController.allowSwipeToSelect = true
        pickerController.assetType = .allPhotos
        pickerController.sourceType = .both
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            
            print("didSelectAssets")
            print(assets)
            if assets.count == 3 {
                self.arrImages.removeAll()
                for asset in assets {
                    
                    let img = GlobalFunction.Instance.getCustomImageData(asset: asset.originalAsset!)
                    
                    let tmpObj = AssetModel()
                    tmpObj.image = img
                    tmpObj.is_PDF = false
                    tmpObj.isFront = true
                    self.arrImage.append(["objAsset":tmpObj,"key":"test"])
                    self.arrImages.append(tmpObj)
                }
                
                print(self.arrImages.count)
                pickerController.dismiss(animated: true) {
                    
                    self.collectionOtherImages.arrImages = self.arrImages
                    self.collectionOtherImages.reloadData()
                    
                     
                }
            }
            else{
                self.collectionOtherImages.arrImages.removeAll()
                GlobalFunction.Instance.showAlertFromAppDelegates(message: "Please select any 3 photos")
            }
        }
        
        self.present(pickerController, animated: true) {}
        
    }
    
    
    func photoUpload(images: [[String :Any]]){
      if Connectivity.isConnectedToInternet(){
        
       for object in images
       {
        
        
        
        
        let imgData = (object["objAsset"] as! AssetModel).image.jpegData(compressionQuality:0.5)
        
        
        let headers = [
            KCONTENTTYPE : KCONTENTTYPE_VALUE
        ]
        
        
        debugPrint("URL :- ",   PHOTOUPLOAD)
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData!, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
           
        },
                         // to: requestUrl as! URLConvertible)
            to: PHOTOUPLOAD, method: .post, headers : (headers ),
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    print(upload.progress)
                    
                    upload.responseJSON {  response in
                        
                        
                        if let value = response.result.value {
                            
                            _ = JSON(value)
                            
                            print("JSON: \(value)")
                        }
                        
                        
                        
                    }
                case .failure(_):
                    GlobalFunction.Instance.showAlertWithMessage(message:NETWORK_ERR_MSG, withController:self)
                }
        })
        
        }
      }
      else{
         GlobalFunction.Instance.showAlertWithMessage(message:NETWORK_ERR_MSG, withController:self)
        }
    }
  
}

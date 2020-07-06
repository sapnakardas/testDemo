
import UIKit
import Photos
class GlobalFunction: NSObject {
    
    // Instance declaration
    static let Instance = GlobalFunction()
    
    // MARK: - Show Alert in UIViewController
       func showAlertWithMessage(message: String, withController viewCtr: UIViewController) {
           let  alertController = UIAlertController(title:"TestDemo", message: message, preferredStyle:.alert)
           alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
              // print("Handle Ok logic here")
           }))
           viewCtr.present(alertController, animated: true, completion: nil)
       }
       
       // MARK: - Show Alert in Application delegate
       func showAlertFromAppDelegates(message: String) {
           
           let alert = UIAlertController(
               title: "TestDemo",
               message: message,
               preferredStyle: .alert
           )
           alert.addAction(UIAlertAction(
               title: "OK",
               style: .default,
               handler: nil
           ))
           UIApplication.shared.keyWindow?.rootViewController?.present(
               alert,
               animated: true,
               completion: nil
           )
       }
    
    
    //MARK:- Validation
     public func validateName(name: String) ->Bool {
         // Length be 18 characters max and 3 characters minimum, you can always modify.
         let nameRegex = "^\\w{3,18}$"
         let trimmedString = name.trimmingCharacters(in: .whitespaces)
         let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
         let isValidateName = validateName.evaluate(with: trimmedString)
         return isValidateName
      }
      public func validaPhoneNumber(phoneNumber: String) -> Bool {
         let phoneNumberRegex = "^[6-9]\\d{9}$"
         let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
         let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
         let isValidPhone = validatePhone.evaluate(with: trimmedString)
         return isValidPhone
      }
      public func validateEmailId(emailID: String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
         let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         let isValidateEmail = validateEmail.evaluate(with: trimmedString)
         return isValidateEmail
      }
  
     func getCustomImageData(asset: PHAsset) -> UIImage
     {
         var img = UIImage()
         let manager = PHImageManager.default()
         let options = PHImageRequestOptions()
         options.version = .original
         options.isSynchronous = true
         manager.requestImageData(for: asset, options: options) { data, _, _, _ in

             if let tmpData = data {
                 img = UIImage(data: tmpData) ?? UIImage()
             }
             else
             {
                 img = UIImage()
             }
         }
         return img
     }
    func app_DateFromString(strDate:String, format:String) -> Date? {
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let dtDate = dateFormatter.date(from: strDate){
            return dtDate as Date?
        }
        return nil
    }

    func app_StringFromDate(date:Date, currentFormat:String = "", requiredFormate:String) -> String? {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormat
    //    let strDate = dateFormatter.string(from:date)
    //    guard let dtDate = app_DateFromString(strDate: strDate, format: requiredFormate) else { return nil }
        dateFormatter.dateFormat = requiredFormate
        return dateFormatter.string(from:date)
    }
    
    //Color 
    
     func hexStringToUIColor (hex:String) -> UIColor {
           var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
           var rgbValue:UInt32 = 0
           
           Scanner(string: cString).scanHexInt32(&rgbValue)
           if (cString.hasPrefix("#")) {
               cString.remove(at: cString.startIndex)
           }
           if ((cString.count) != 6) {
               return UIColor.gray
           }
           return UIColor(
               red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
           )
       }
    
}

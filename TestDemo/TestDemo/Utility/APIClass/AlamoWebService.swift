
import Foundation
import Alamofire
import SwiftyJSON




//Check Internet Connection
class Connectivity{
    class func isConnectedToInternet() ->Bool{
        return NetworkReachabilityManager()!.isReachable
    }
}

// Webservice calling global class

class AlamoWebService{
    
   class func callWebService(strUrl : String?,withParameters parameters: [String : Any]?,httpMethod : HTTPMethod?, withSuccessHandler success : (([String : AnyObject]?) -> Void)?, withErrorHandler errorMsg : ((String?) -> Void)?) {
     
        let manager = SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = timeout
        let headers = [
            KCONTENTTYPE : KCONTENTTYPE_VALUE
        ]
    
        manager.request(strUrl!, method: httpMethod!, parameters: parameters,headers : headers).validate().responseJSON { response in
         switch response.result {
            case .success:
                if let value = response.result.value as? [String: AnyObject]  {
                    let jsonData = JSON(value)
                    print("JSON: \(jsonData)")
                    if (jsonData["code"] == "1") {
                        success?(value)
                    }else{
                        
                            GlobalFunction.Instance.showAlertFromAppDelegates(message:V_INVALID_RESPONSE)
                        
                    }
                }
            case .failure(let error):
                print(error)
                if let data = response.data {
                    print(" data: \(NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)")
                    if (error as NSError).code != NSURLErrorCancelled {
                        if ((error as NSError).code == -1001 || (error as NSError).code == -1005) {
                           
                            self.callWebService(strUrl: strUrl, withParameters: parameters, httpMethod: httpMethod, withSuccessHandler: { (_) in }, withErrorHandler: { (_) in})
                        } else {
                            errorMsg?(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }

   
 
}



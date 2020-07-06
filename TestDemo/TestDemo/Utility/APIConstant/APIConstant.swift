
import Foundation
import UIKit

let timeout        = Double(10)

// MARK: - For Common Parameter of Header
let KCONTENTTYPE            = "API-KEY"
let KCONTENTTYPE_VALUE      = "590bf61f7a61fc559da19c7927da1c9e"
let MainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
// MARK: - For Set URL

//http://132.148.17.145/~hyperlinkserver/ned/api/v1/smyllo/signup/
//http://132.148.17.145/~hyperlinkserver/ned/api/v1/smyllo/upload_image/

let BaseURL                                 = "http://132.148.17.145/~hyperlinkserver/ned/api/v1/smyllo/"
// User
let SIGNUP                                       = BaseURL + "signup/"

let PHOTOUPLOAD                                 = BaseURL + "upload_image/"

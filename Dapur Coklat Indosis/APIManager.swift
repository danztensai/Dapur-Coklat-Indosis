//
//  APIManager.swift
//  Dapur Coklat Indosis
//
//  Created by Danial Habibi on 3/17/18.
//  Copyright © 2018 Indosis. All rights reserved.
//

import UIKit
import UIKit
import SwiftyJSON
class APIManager: NSObject {
    let baseURL = "http://122.129.112.169/opik/dapurcokelat_delivery/"
    static let sharedInstance = APIManager()
    static let getPostsEndpoint = "/posts/"
    static let getUserLogin="/login/login"
    
    func getUserLogin(username:String,password:String, onSuccess:@escaping(JSON)-> Void, onFailure: @escaping(Error)->Void){
        let url:String = baseURL+APIManager.getUserLogin
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod="POST"
        let postString = "username="+username+"&password="+password
        request.httpBody = postString.data(using: .utf8)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest,completionHandler:{data,response,error->Void in if(error != nil){onFailure(error!)
            
        }else {
            let result = try!JSON(data: data!)
            onSuccess(result)
            }
            
        })
        task.resume()
        
    }
}

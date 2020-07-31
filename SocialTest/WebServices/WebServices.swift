//
//  WebServices.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/26/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Alamofire
import Arrow

struct WebServices {
    internal typealias Success              = (_ response: JResponse) -> ()
    internal typealias Failure              = (_ response: JResponse) -> ()
    
    static func isConnected(failure: Failure? = nil) -> Bool {
        //TODO : check connection and call failure with custom response if not connected
        return true
    }
    
    static func request(url: String,
                        method: HTTPMethod = .get,
                        params: [String: Any] = [:],
                        resultType: ArrowParsable.Type? = nil,
                        success: Success?,
                        failure: Failure?) {
        if !isConnected(failure: failure) {
            return
        }
        
        let headers = [String:String]()
        //TODO : set token if needed
        //headers = ["t": "ThisIsToken" ]
        
        
        //request
        Alamofire.request(url,
                          method: method,
                          parameters: params.count == 0 ? nil : params,
                          encoding: JSONEncoding.default,
                          headers: headers).responseJSON { response in
                            responseJSON(response: response)
        }
        
        func responseJSON(response: DataResponse<Any>) {
            var jResponse = JResponse(resultType.self)
            jResponse.parse(response.result.value)
            
            //TODO : set custom failure for bad condition
            let succeeded = response.result.isSuccess
            if succeeded {
                success?(jResponse)
            } else {
                failure?(jResponse)
            }
        }
        
    }
    
}

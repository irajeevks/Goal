//
//  ApiCall.swift
//  Goal
//
//  Created by RAjeev Singh on 27/09/21.
//

import UIKit

let baseUrl = "https://dynamic.pulselive.com/test/native"

class APICommunicator: NSObject {
    
    class func getData(_ onUrl: String, headers: [String : String]?,
                        parameters: [String : Any]?,
                        successClosure: @escaping (AnyObject?, Data) -> (),
                        onFailure failureClosure: ((AnyObject?)->())?)
    {
        var request = URLRequest(url: URL(string: baseUrl+onUrl)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with:request, completionHandler: {(data, response, error) in
            if(error == nil) {
                if let httpResponse = response as? HTTPURLResponse {
                   if(httpResponse.statusCode == 200) { //API status code
                        if let data = data {
                            let jsonResonse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : AnyObject]
                            successClosure(jsonResonse as AnyObject?, data)
                           
                        } else {
                            failureClosure?("Status 200 but data nil" as AnyObject?)
                        }
                    }
                }
            }
            else {
                failureClosure?("" as AnyObject?)
            }
        }).resume()
    }
}

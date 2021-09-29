//
//  ApiCall.swift
//  Goal
//
//  Created by RAjeev Singh on 27/09/21.
//

import UIKit

struct APIConstants {
    static let K_API_AUTH_TOKEN = "as*)^&^e2342aasr2!@!#!@$!@&*(%^sd234"
    static let K_API_HEADERS    = ["Authorization" : APIConstants.K_API_AUTH_TOKEN,
                                   "Content-Type" : "application/json"]
    
    struct APIName {
        static let contentList                 = "/contentList.json"
        static let detailApi                   = "/content/"
    }
}

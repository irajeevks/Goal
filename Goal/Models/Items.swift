//
//  Items.swift
//  Goal
//
//  Created by RAjeev Singh on 27/09/21.
//

import Foundation

struct Items : Codable {
  var id        : Int?
  var title     : String? = ""
  var subtitle  : String?
  var date      : String?
    
    func checkIfEmpty (title: String?, subtitle: String?) -> String {
        
        if title == nil {
            return "title is nil"
        }else if subtitle == nil {
            return "subtitle is nil"
        }
        return ""
    }
}

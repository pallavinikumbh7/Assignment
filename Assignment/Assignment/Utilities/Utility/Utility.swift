//
//  Utility.swift
//  Assignment
//
//  Created by Pallavi on 04/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation

class Utility: NSObject {
    
    private static var utility: Utility = {
           let utility = Utility()
           return utility
       }()
       
    private override init() {}
       
    class func sharedInstance() -> Utility {
        return utility
    }
    
    func getDataFromPlist(keyName: String) -> Any {
        var data: Any?
        if let path = Bundle.main.path(forResource: Constants.kStaticDataPlist, ofType: Constants.kPlistExtension) {
            //If your plist contain root as Dictionary
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                data = dic[keyName]
            }
        }
        return data as Any
    }
}

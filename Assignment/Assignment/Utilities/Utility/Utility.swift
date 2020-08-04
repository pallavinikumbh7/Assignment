//
//  Utility.swift
//  Assignment
//
//  Created by Pallavi on 04/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject {
    
    var activityIndicator = UIActivityIndicatorView()
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
    
    func showActivityIndicator(view: UIView) {
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.center = view.center
        activityIndicator.color = UIColor.yellow
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}

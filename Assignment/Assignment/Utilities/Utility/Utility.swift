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
    var bgView = UIView()
    
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
        bgView = UIView(frame: UIScreen.main.bounds)
        bgView.backgroundColor = UIColor(white: 0.5, alpha: 0.6)
        view.addSubview(bgView)
        bgView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        bgView.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
    
    func addBoldText(fullString: String, boldString: String, font: UIFont, boldFont: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: fullString, attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont]
        let strRange: NSString = fullString as NSString
        attributedString.addAttributes(boldFontAttribute, range: strRange.range(of: boldString))
        return attributedString
    }
    
    func convertUTCToDateString(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: "2015-11-06T01:33:38Z") {
            dateFormatter.dateFormat = "dd-MM-yy"
            return dateFormatter.string(from: date)
        }
        return ""
    }
}

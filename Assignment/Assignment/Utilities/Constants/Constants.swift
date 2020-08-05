//
//  Constants.swift
//  Assignment
//
//  Created by Pallavi on 02/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation
import UIKit

enum SortType: String {
    case ascending = "Name (A-Z)"
    case descending = "Name (Z-A)"
    case ascendingRank = "Rank ↑"
    case descendingRank = "Rank ↓"
}

enum Cell: Int {
    case name = 0
    case description
    case url
    case language
    case createdOn
}

enum Storyboards: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

let regularFont = UIFont(name: "Lato-Regular", size: 17)
let boldFont = UIFont(name: "Lato-Bold", size: 17)

class Constants: NSObject {
    
    static let BaseURL = "https://api.github.com"
    static let kPlistExtension = "plist"
    static let kStaticDataPlist = "StaticData"
    
    struct StoryboardIDs {
        static let userDetailViewController = "UserDetailViewController"
    }
    
    struct Service {
        static let searchUser = "/search/users?q=%@"
        static let userDetail = "/users/%@/repos"
    }
    
    struct StaticData {
        static let userDetail = "UserDetails"
    }
}

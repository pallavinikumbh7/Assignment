//
//  SearchResultService.swift
//  Assignment
//
//  Created by Pallavi on 31/07/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation
import Alamofire

func searchForMatchesWithTitle(searchText: String, handler:@escaping ([SearchResponseBO], Error?) -> Void) {
    let endUrl = String(format: "https://api.github.com/search/users?q=%@", searchText)
   AF.request(endUrl)
    .responseJSON { response in
        do {
            let searchResponseBO = try JSONDecoder().decode(SearchResponseBO.self, from: response)
        } catch let error {
            print(error)
        }
        handler([SearchResponseBO], <#Error?#>)
    }
}

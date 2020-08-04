//
//  SearchResultService.swift
//  Assignment
//
//  Created by Pallavi on 31/07/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation
import Alamofire

class SearchResultService: NSObject {
    func getRepoListWithSerchString(searchText: String, handler:@escaping (Result<SearchResponseBO, Error>) -> Void) {
        let endUrl = String(format: "https://api.github.com/search/users?q=%@", searchText)
        AF.request(endUrl, method: .get)
        .responseJSON { response in
            do {
                if let data = response.data {
                  let superStructureBO = try JSONDecoder().decode(SearchResponseBO.self, from: data)
                    handler(.success(superStructureBO))
                }
            } catch let error {
                print(error)
                handler(.failure(error))
            }
        }
    }
}

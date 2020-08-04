//
//  UserDetailService.swift
//  Assignment
//
//  Created by Pallavi on 04/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import Foundation
import Alamofire

class UserDetailService: NSObject {
    func getUserDetailWith(userName: String, handler:@escaping (Result<[UserDetailsBO], Error>) -> Void) {
        let endUrl = String(format: Constants.BaseURL + Constants.Service.userDetail, userName)
        AF.request(endUrl, method: .get)
        .responseJSON { response in
            do {
                if let data = response.data {
                  let userDetailsBO = try JSONDecoder().decode([UserDetailsBO].self, from: data)
                    handler(.success(userDetailsBO))
                }
            } catch let error {
                print(error)
                handler(.failure(error))
            }
        }
    }
}

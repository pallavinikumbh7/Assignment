//
//  UserDetailViewController.swift
//  Assignment
//
//  Created by Pallavi on 04/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var userDetailsTable: UITableView!
    
    private var userDetailService: UserDetailService?
    var selectedUser = String()
    var userDetailsArray = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseUserDetailService()
        self.title = "User Detail"
        self.navigationController?.navigationBar.tintColor = .white
        viewProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        viewProfileButton.layer.borderWidth = 1
        viewProfileButton.layer.cornerRadius = 5
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        if let data = Utility.sharedInstance().getDataFromPlist(keyName: Constants.StaticData.userDetail) as? [[String: Any]] {
            userDetailsArray.append(contentsOf: data)
        }
        getUserDetails(userName: selectedUser)
    }
    
    private func initialiseUserDetailService() {
        if userDetailService == nil {
            userDetailService = UserDetailService()
        }
    }
    
    private func getUserDetails(userName: String) {
            userDetailService?.getUserDetailWith(userName: userName, handler: {[weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let userData):
                  self.setUpData(userData: userData)
                  self.userDetailsTable.reloadData()
                case .failure(let error):
                    print(error)
                    self.userDetailsArray = []
                }
            })
        }
    
    func setUpData(userData: ([UserDetailsBO])) {
        if !userData.isEmpty {
            for (index, data) in self.userDetailsArray.enumerated() {
                var details = data
                switch index {
                case Cell.name.rawValue:
                    details["value"] = userData.first?.name
                    self.userDetailsArray[index] = details
                case Cell.description.rawValue:
                    details["value"] = userData.first?.descriptionField
                    self.userDetailsArray[index] = details
                case Cell.url.rawValue:
                    details["value"] = userData.first?.owner?.htmlUrl
                    self.userDetailsArray[index] = details
                case Cell.language.rawValue:
                    details["value"] = userData.first?.language
                    self.userDetailsArray[index] = details
                case Cell.createdOn.rawValue:
                    details["value"] = userData.first?.createdAt
                    self.userDetailsArray[index] = details
                default:
                    break
                }
            }
            self.userNameLabel.text = userData.first?.fullName
            if let imageURL = URL(string: userData.first?.owner?.avatarUrl ?? "") {
                self.profileImage.af.setImage(withURL: imageURL)
            } else {
                self.profileImage.image = #imageLiteral(resourceName: "user")
            }
        }
    }
}

extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserDetailTableViewCell.self)) as? UserDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCellWithData(data: userDetailsArray[indexPath.row])
        return cell
    }
}

//extension UserDetailViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}

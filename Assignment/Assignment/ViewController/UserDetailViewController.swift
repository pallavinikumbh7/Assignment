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
    
    var iconsArray = [#imageLiteral(resourceName: "attach"), #imageLiteral(resourceName: "folder"), #imageLiteral(resourceName: "clip"), #imageLiteral(resourceName: "brackets"), #imageLiteral(resourceName: "calendar")]
    private var userDetailService: UserDetailService?
    var selectedUser = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseUserDetailService()
        self.title = "User Detail"
        self.navigationController?.navigationBar.tintColor = .white
        viewProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        viewProfileButton.layer.borderWidth = 1
        viewProfileButton.layer.cornerRadius = 2
        if let data = Utility.sharedInstance().getDataFromPlist(keyName: Constants.StaticData.userDetail) as? [[String: Any]] {
            print(data)
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
//                    self.searchList = searchData.items ?? []
//                    self.userDetailsTable.text = "Showing \(self.searchList.count) results"
                    if let imageURL = URL(string: userData[0].owner?.avatarUrl ?? "") {
                        self.profileImage.af.setImage(withURL: imageURL)
                    } else {
                        self.profileImage.image = #imageLiteral(resourceName: "user")
                    }
                    self.userDetailsTable.reloadData()
                case .failure(let error):
                    self.iconsArray = []
                }
            })
        }
}

extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserDetailTableViewCell.self)) as? UserDetailTableViewCell else {
            return UITableViewCell()
        }
        let iconImage = iconsArray[indexPath.row]
        cell.configureCellWithData(icon: iconImage)
        return cell
    }
}

extension UserDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//
//  UserDetailTableViewCell.swift
//  Assignment
//
//  Created by Pallavi on 04/08/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension UserDetailTableViewCell {
    func configureCellWithData(data: [String: Any]) {
        iconImage.image = UIImage(named:( data["image"] as? String ?? ""))
        titleLabel.text = data["title"] as? String ?? ""
        valueLabel.text = data["value"] as? String ?? "-"
        if data["title"] as? String ?? "" == "Repository URL:" {
            valueLabel.textColor = UIColor.blue
        }
    }
}

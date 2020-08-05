//
//  SearchTableViewCell.swift
//  Assignment
//
//  Created by Pallavi on 31/07/20.
//  Copyright © 2020 Pallavi. All rights reserved.
//

import UIKit
import AlamofireImage

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var viewDetailButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        // Initialization code
    }
}

extension SearchTableViewCell {
    func configureData(repoData: Item) {
        nameLable.text = repoData.login
        scoreLabel.attributedText = Utility.sharedInstance().addBoldText(fullString: ("Score: \(repoData.score ?? 0)"), boldString: "\(repoData.score ?? 0)", font: regularFont ?? UIFont(), boldFont: boldFont ?? UIFont())
        if let imageURL = URL(string: repoData.avatarUrl ?? "") {
            profileImage.af.setImage(withURL: imageURL)
        } else {
            profileImage.image = #imageLiteral(resourceName: "user")
        }
    }
}

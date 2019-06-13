//
//  RecommendationCell.swift
//  ReadIt
//
//  Created by Thara Nagaraj on 6/8/19.
//  Copyright © 2019 Thara Nagaraj. All rights reserved.
//

import UIKit

class RecommendationCell: UITableViewCell {

    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

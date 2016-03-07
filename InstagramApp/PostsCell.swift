//
//  PostsCell.swift
//  InstagramApp
//
//  Created by WUSTL STS on 3/6/16.
//  Copyright © 2016 jinseokpark. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

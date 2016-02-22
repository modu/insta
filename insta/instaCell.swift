//
//  instaCell.swift
//  insta
//
//  Created by Varun Vyas on 21/02/16.
//  Copyright © 2016 Varun Vyas. All rights reserved.
//

import UIKit

class instaCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

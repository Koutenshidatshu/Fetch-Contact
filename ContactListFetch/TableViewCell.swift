//
//  TableViewCell.swift
//  ContactListFetch
//
//  Created by Yonathan on 3/27/17.
//  Copyright © 2017 Yonathan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var isFave = false
    
    override func layoutSubviews() {
        self.imagePic.layer.cornerRadius = self.imagePic.frame.size.width/2
        self.imagePic.layer.masksToBounds = true
        self.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

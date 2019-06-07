//
//  TableViewCell.swift
//  JSON-Project
//
//  Created by Greeens5 on 06/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var title: UILabel!
    @IBOutlet var iddeal: UILabel!
    @IBOutlet var caticon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

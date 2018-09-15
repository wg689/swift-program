//
//  MainTableViewCell.swift
//  Artistry
//
//  Created by  汪刚 on 2018/9/15.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var lable1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

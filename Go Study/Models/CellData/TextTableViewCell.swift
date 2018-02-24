//
//  TextTableViewCell.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/11.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    let style: CellStyle = .textStyle
    @IBOutlet weak var leftLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

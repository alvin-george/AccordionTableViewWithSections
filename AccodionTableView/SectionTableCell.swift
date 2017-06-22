//
//  SectionTableCell.swift
//  AccodionTableView
//
//  Created by apple on 22/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class SectionTableCell: UITableViewCell {

    @IBOutlet weak var accordionImageView: UIImageView!
    @IBOutlet weak var accordionButton: UIButton!
    @IBOutlet weak var accordionTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

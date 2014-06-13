//
//  EMCountrySelectorCell.swift
//  ember
//
//  Created by John A Torres B on 10/06/14.
//  Copyright (c) 2014 ember. All rights reserved.
//

import UIKit

class EMCountrySelectorCell: UITableViewCell {

    @IBOutlet var contryFlag : UIImageView
    @IBOutlet var countryLabel : UILabel
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

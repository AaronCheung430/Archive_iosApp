//
//  QuoteCustomCell.swift
//  SimpleQuote
//
//  Created by Aaron Cheung 430 on 1/9/2018.
//  Copyright © 2018年 Aaron Cheung 430. All rights reserved.
//

import UIKit

class QuoteCustomCell: UITableViewCell {

    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var speakerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

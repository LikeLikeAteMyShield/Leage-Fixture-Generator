//
//  ClubTableViewCell.swift
//  League Fixture Generator
//
//  Created by Jonny Cameron on 21/12/2015.
//  Copyright © 2015 Jonny Cameron. All rights reserved.
//

import UIKit

class ClubTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var juniorImageView: UIImageView!
    @IBOutlet weak var seniorImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

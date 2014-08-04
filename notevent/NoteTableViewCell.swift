//
//  NoteTableViewCell.swift
//  notevent
//
//  Created by InSTEDD on 8/4/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet var titleCell: UILabel!
    
    @IBOutlet var descriptionCell: UILabel!

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

//
//  MyTableViewCell.swift
//  Recipe App
//
//  Created by Syimyk on 10/10/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage : UIImageView!
    @IBOutlet weak var titleFood : UILabel!
    @IBOutlet weak var myView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

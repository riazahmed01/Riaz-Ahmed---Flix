//
//  movieCell.swift
//  Riaz Ahmed - Flix
//
//  Created by RIAZ on 2/18/21.
//

import UIKit

class movieCell: UITableViewCell {

    @IBOutlet weak var titlelable: UILabel!
    @IBOutlet weak var synlable: UILabel!
    @IBOutlet weak var posterimg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

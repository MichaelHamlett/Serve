//
//  PostCell.swift
//  Serve
//
//  Created by Bamlak Gessessew on 7/11/17.
//  Copyright © 2017 Bamlak Gessessew. All rights reserved.
//

import UIKit
import TTTAttributedLabel
import Parse


class PostCell: UITableViewCell {

    @IBOutlet weak var linkLabel: TTTAttributedLabel!
    
    @IBOutlet weak var eventLabel: UILabel!
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var actionLabel: UILabel!
    
    var event : PFObject?
    var user: PFUser?

    @IBAction func eventLabelPressed(_ sender: Any) {
        
    }
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

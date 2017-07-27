//
//  EventBrowseCell.swift
//  Serve
//
//  Created by Bamlak Gessessew on 7/20/17.
//  Copyright © 2017 Bamlak Gessessew. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class EventBrowseCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageViewer: PFImageView!
    var pic : PFFile?
    @IBOutlet weak var button: UIButton!
    
    var indexPath: IndexPath?{
        didSet{
            button.tag = (indexPath?.item)!
        }
    }
    
    var event: PFObject! {
        didSet{
            nameLabel.text = event["title"] as? String
            pic = event["banner"] as? PFFile
            imageViewer.image = nil
            pic?.getDataInBackground(block: { (data: Data?, error: Error?) in
                if (error != nil) {
                    print(error?.localizedDescription ?? "error")
                } else {
                    let finalImage = UIImage(data: data!)
                    self.imageViewer.image = finalImage
                }
            })
            
        }
    }
    
    
    
    
}

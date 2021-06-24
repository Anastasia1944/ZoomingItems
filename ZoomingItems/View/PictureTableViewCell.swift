//
//  PictureTableViewCell.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 24.06.2021.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

    @IBOutlet weak var picNameLabel: UILabel!
    
    var picture: Picture? {
      didSet {
        guard let picture = picture else { return }

        picNameLabel.text = picture.name
      }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

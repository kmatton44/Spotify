//
//  SearchTableViewCell.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/16/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchTableImage: UIImageView!
    @IBOutlet weak var searchTableLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        searchTableImage.layer.cornerRadius = 40
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  NewsCell.swift
//  MVVM Api
//
//  Created by Yusmi Putra on 7/27/23.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var judulNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

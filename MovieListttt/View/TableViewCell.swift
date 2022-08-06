//
//  TableViewCell.swift
//  MovieListttt
//
//  Created by Raşit Kaplan on 23.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageVieww: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageVieww.layer.cornerRadius = 8
    }
}

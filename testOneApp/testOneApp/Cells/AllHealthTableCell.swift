//
//  AllHealthTableCell.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class AllHealthTableCell: UITableViewCell {

    @IBOutlet weak var allHealthBaseView: UIView!
    @IBOutlet weak var allHealthLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        allHealthLabel.text = "Show All Health Data"
        allHealthBaseView.layer.cornerRadius = 10.0
        allHealthBaseView.backgroundColor = UIColor.white
        allHealthLabel.textColor = UIColor.systemBlue
    }
    
}

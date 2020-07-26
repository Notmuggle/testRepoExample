//
//  ActivityTableViewCell.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet weak var cellBaseView: UIView!
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var execiseLabel: UILabel!
    @IBOutlet weak var standLabel: UILabel!
    @IBOutlet weak var moveValLabel: UILabel!
    @IBOutlet weak var moveValSILabel: UILabel!
    
    @IBOutlet weak var exerValLabel: UILabel!
    
    @IBOutlet weak var exerSIValLabel: UILabel!
    @IBOutlet weak var standValLabel: UILabel!
    
    @IBOutlet weak var standSiLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        titleLabel.textColor = UIColor.orange
        moveLabel.textColor = UIColor.red
        execiseLabel.textColor = UIColor.green
        standLabel.textColor = UIColor.blue
        
        titleLabel.text = "Activity"
        moveLabel.text = "Move"
        execiseLabel.text = "Exercise"
        standLabel.text = "Stand"
        
        cellBaseView.backgroundColor = UIColor.white
        cellBaseView.layer.cornerRadius = 10.0
    }
    
}

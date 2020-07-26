//
//  StepsTableViewCell.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class StepsTableViewCell: UITableViewCell {
    @IBOutlet weak var cellBaseView: UIView!
    @IBOutlet weak var stepImage: UIImageView!
    
    @IBOutlet weak var stepTitleLabel: UILabel!
    @IBOutlet weak var numberOfStepsLabel: UILabel!
    
    @IBOutlet weak var stepsSiLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        cellBaseView.backgroundColor = UIColor.white
        cellBaseView.layer.cornerRadius = 10.0
    }
    
}

//
//  ElementTableViewCell.swift
//  Elements
//
//  Created by Ibraheem rawlinson on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    @IBOutlet weak var periodicTableImage: UIImageView!
    @IBOutlet weak var nameOfElement: UILabel!
    @IBOutlet weak var symbolAndAtomicMass: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

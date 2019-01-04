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
    var elementsIExpect: PeriodicTableData! {
        didSet{
            updateMyElementUI()
        }
    }
    
    func updateMyElementUI(){
    
        guard let elementSymbol = elementsIExpect.symbol, let atomicMassOfTheElement = elementsIExpect.atomicMass, let name = elementsIExpect.name, let elementNumber = elementsIExpect.number else {
            return
        }
    
        nameOfElement.text = name
        let secondLabel = "\(elementSymbol)(\(elementNumber)) \(atomicMassOfTheElement)"
        symbolAndAtomicMass.text = secondLabel
    }

}

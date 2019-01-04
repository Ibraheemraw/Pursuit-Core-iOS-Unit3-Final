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
            var value = ""
            value = String(format: "%03d", elementNumber)
       
        let imageURL = "http://www.theodoregray.com/periodictable/Tiles/\(value)/s7.JPG"
        ImageHelper.shared.fetchImage(urlString: imageURL) { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                DispatchQueue.main.async {
                    self.periodicTableImage.image = image
                }
            }
        }
        
    }
}

//
//  DetailEVC.swift
//  Elements
//
//  Created by Ibraheem rawlinson on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailEVC: UIViewController {
    @IBOutlet weak var largerElementImage: UIImageView!
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var numberOfElementInThePT: UILabel!
    @IBOutlet weak var atomicMassValue: UILabel!
    @IBOutlet weak var meltingPointValue: UILabel!
    @IBOutlet weak var boilingPointValue: UILabel!
    @IBOutlet weak var elementWasDiscoveredBy: UILabel!
    @IBOutlet weak var myFavoriteElement: UIBarButtonItem!
    var iExpectAnElmentFromThePeriodicTable: PeriodicTableData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func addThisElementToMyFavorites(_ sender: Any) {
    }
    
}

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
        updatingMyDetailVCItems()
        if let navTitle = iExpectAnElmentFromThePeriodicTable.name {
            title = navTitle
        }
    }
    func updatingMyDetailVCItems(){
        guard let symbol = iExpectAnElmentFromThePeriodicTable.symbol, let number = iExpectAnElmentFromThePeriodicTable.number, let am = iExpectAnElmentFromThePeriodicTable.atomicMass, let mp = iExpectAnElmentFromThePeriodicTable.melt, let bp = iExpectAnElmentFromThePeriodicTable.boil, let founder = iExpectAnElmentFromThePeriodicTable.namedBy else {
            return
        }
        elementSymbol.text = "Element: \(symbol)"
        numberOfElementInThePT.text = "Electrons: \(number)"
        atomicMassValue.text = "Atomic Weight: \(am)"
        meltingPointValue.text = "Melting Point: \(mp)"
        boilingPointValue.text = "Boiling Point: \(bp)"
        elementWasDiscoveredBy.text = "Discovering Scientist: \(founder)"
        
    }
    @IBAction func addThisElementToMyFavorites(_ sender: Any) {
        guard let  name = iExpectAnElmentFromThePeriodicTable.name, let symbol = iExpectAnElmentFromThePeriodicTable.symbol else {return}
        let myFavortite = Favorite.init(elementName: name, elementSymbol: symbol, favoritedBy: "Ibaheem The Science Guy")
        do {
            let data  = try JSONEncoder().encode(myFavortite)
            PeriodicTableApiClient.sendElementMyFavorites(data: data) { (appError, success) in
                if let appError = appError {
                    print("Sending podcast to favorites error: \(appError)")
                } else if success {
                    print("Successfully added to the favorites qeue")
                } else {
                    print("was not successfull")
                }
            }
        } catch {
            print("error is \(error)")
        }
    }
    
}

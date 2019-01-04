//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementVC: UIViewController {
    @IBOutlet weak var periodicTableTableView: UITableView!
    var elements = [PeriodicTableData](){
        didSet{
            DispatchQueue.main.async {
                <#code#>
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}


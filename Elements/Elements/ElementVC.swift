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
                self.periodicTableTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        periodicTableTableView.dataSource = self
        findElements()
        
    }
    func findElements(){
        PeriodicTableApiClient.searchForElementsInThePeriodicTable { (appError, elementsInPT) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let elementsInPT = elementsInPT {
                print("found \(elementsInPT.count) elements")
//                self.podcasts = podcasts
            }
        }
    }
    
    
}
extension ElementVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

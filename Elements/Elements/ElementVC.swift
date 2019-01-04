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
        periodicTableTableView.delegate = self
        findElements()
        
    }
    func findElements(){
        PeriodicTableApiClient.searchForElementsInThePeriodicTable { (appError, elementsInPT) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let elementsInPT = elementsInPT {
//                print("found \(elementsInPT.count) elements")
                self.elements = elementsInPT
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailEVC, let indexPath = periodicTableTableView.indexPathForSelectedRow else {fatalError("Error with the perapre for segue function")}
        destination.iExpectAnElmentFromThePeriodicTable = elements[indexPath.row]
        
    }
    
    
}
extension ElementVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
extension ElementVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as? ElementTableViewCell else {return UITableViewCell()}
        let settingMyElements = elements[indexPath.row]
        cell.elementsIExpect = settingMyElements
        return cell
    }
    
    
}

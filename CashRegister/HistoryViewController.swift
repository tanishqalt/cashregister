//
//  HistoryViewController.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 27/02/22.
//

import UIKit

var globalBuyingHistory = [HistoryObject]();
var selectedHistoryItem = 0;

class HistoryViewController: UITableViewController {

    var buyingHistory = [HistoryObject]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyingHistory.append(HistoryObject(name: "Shoes", quantity: 10, totalPrice: 120, purchaseDate: "123"));
        
        let nib = UINib(nibName: "CustomTableView", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CustomTableView")
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return globalBuyingHistory.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath);
        selectedHistoryItem = indexPath.row;
        print(selectedHistoryItem)
        performSegue(withIdentifier: "mySegue", sender: cell)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableView", for: indexPath) as! CustomTableView
        cell.itemName.text = globalBuyingHistory[indexPath.row].name;
        cell.UnitPrice.text = String(globalBuyingHistory[indexPath.row].totalPrice);
        cell.itemQty.text=""
        return cell;
    }
  
}

//
//  RestockViewController.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 27/02/22.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var quantityInput: UITextField!
    
    @IBOutlet weak var restockButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var inputQuantity: Int = 0;
    var restockSelectedIndex = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        let nib = UINib(nibName: "CustomTableView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableView")
        quantityInput.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        restockSelectedIndex = indexPath.row;
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableView", for: indexPath) as! CustomTableView
        
        cell.itemName.text = inventory[indexPath.row].name;
        cell.itemQty.text = String(inventory[indexPath.row].itemQuantity);
        cell.UnitPrice.text = String(inventory[indexPath.row].price);
        
        return cell;
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func restockPressed(_ sender: Any) {
        
        print("presssing");
        
        let inputQuantity = Int(quantityInput.text ?? "0");
        
        // check if the selectedIndex is minus 1, if yes, show the error
        if(restockSelectedIndex == -1){
            // failed update
            let alert = UIAlertController(title: "Alert", message: "Please select the type", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            return;
        }
        
        if(inputQuantity == 0 ){
            let alert = UIAlertController(title: "Alert", message: "Please enter the quantity", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            return;
        }
        
        var currentItem = inventory[restockSelectedIndex];
        currentItem.itemQuantity = currentItem.itemQuantity + inputQuantity!;
        inventory[restockSelectedIndex] = currentItem;
        tableView.reloadData()
    }
    
}

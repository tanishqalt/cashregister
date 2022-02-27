//
//  ViewController.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 26/02/22.
//

import UIKit

// arrays of objects
struct Item {
   var name: String
   var price: Int
   var itemQuantity:Int
}

var inventory = [Item]();


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // strings
    var output = "";
    var type = "";
        
    // selected Item
    var selectedItemPrice = 0;
    var selectedItemQuantity=0;
    
    var liveQuantity = "";
    var total = 0;
    var selectedItemNumber = 0;

    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var digitMultiplier = 0;
    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self;
        tableView.dataSource=self;
        
        inventory.append(Item(name: "Pants", price:
                                10, itemQuantity: 20))
        inventory.append(Item(name: "Shoes", price:
                                15, itemQuantity: 50))
        inventory.append(Item(name: "Hats", price:
                                20, itemQuantity: 10))
        inventory.append(Item(name: "Tshirts", price:
                                25, itemQuantity: 10))
        inventory.append(Item(name: "Dresses", price:
                                30, itemQuantity: 24))
        
        let nib = UINib(nibName: "CustomTableView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableView")
        
    }


    @IBAction func oneClicked(_ sender: Any) {
        updateLiveQuantity(digit: 1)
    }
    
    @IBAction func twoClicked(_ sender: Any) {
        updateLiveQuantity(digit: 2)
    }
    
    @IBAction func threeClicked(_ sender: Any) {
        updateLiveQuantity(digit: 3)
    }
    
    
    @IBAction func fourClicked(_ sender: Any) {
        updateLiveQuantity(digit: 4)
    }
    
    
    @IBAction func fiveClicked(_ sender: Any) {
        updateLiveQuantity(digit: 5)
    }
    
    @IBAction func sixClicked(_ sender: Any) {
        updateLiveQuantity(digit: 6)
    }
    
    @IBAction func sevenClicked(_ sender: Any) {
        updateLiveQuantity(digit: 7)
    }
    
    
    @IBAction func eightClicked(_ sender: Any) {
        updateLiveQuantity(digit: 8)
    }
    
    
    @IBAction func nineClicked(_ sender: Any) {
        updateLiveQuantity(digit: 9)
    }
    
    @IBAction func zeroClicked(_ sender: Any) {
        updateLiveQuantity(digit: 0)
    }
    
    @IBAction func buyClicked(_ sender: Any) {
    }
    
    // updates the live quantity based on the number input
    public func updateLiveQuantity(digit:Int){
        liveQuantity = liveQuantity.appending(String(digit))
        quantity.text = liveQuantity;
        
        if(selectedItemPrice==0){
            return;
        } else {
            total = Int(liveQuantity) ?? 0;
            total = total * selectedItemPrice;
            totalLabel.text = String(total);
        }
    }
    
    public func resetUI(){
        selectedItemNumber = 0;
        selectedItemQuantity = 0;
        selectedItemPrice = 0;
        type = "";
        typeLabel.text = "Type";
        quantity.text = "Quantity";
        total = 0;
        totalLabel.text = "Total"
        liveQuantity = "";
    
    }
    
    @IBAction func buyButtonPressed(_ sender: Any) {
        // checks if the liveQuantity is more than selectedItemQuantity
        
        
        let numericLiveQuantity = Int(liveQuantity) ?? 0;
        
        if(numericLiveQuantity==0){
            return;
        }
        
        print(numericLiveQuantity)
        if(numericLiveQuantity > selectedItemQuantity){
            
            // failed buy
            let alert = UIAlertController(title: "Alert", message: "Quantity not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
        } else {
            
            // successful buy
            let alert = UIAlertController(title: "Alert", message: "Buy Successfull", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            var currentItem = inventory[selectedItemNumber];
            currentItem.itemQuantity = currentItem.itemQuantity - numericLiveQuantity;
            inventory[selectedItemNumber] = currentItem;
            
            self.present(alert, animated: true, completion: nil)
            tableView.reloadData()
           
            
            globalBuyingHistory.append(HistoryObject(name: currentItem.name, quantity: numericLiveQuantity, totalPrice: numericLiveQuantity * currentItem.price, purchaseDate: ""))

        }
        
        resetUI();
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        type = inventory[indexPath.row].name;
        selectedItemPrice = inventory[indexPath.row].price;
        selectedItemQuantity = inventory[indexPath.row].itemQuantity;
        selectedItemNumber = indexPath.row;
        typeLabel.text = type;
        
        // setting the total
        if(!liveQuantity.isEmpty){
            total = Int(liveQuantity) ?? 0;
            total = total * selectedItemPrice;
            totalLabel.text = String(total);
        }
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        if(animated){
            tableView.reloadData()
        }
    }
    
}

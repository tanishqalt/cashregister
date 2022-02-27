//
//  DetailHistoryViewController.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 27/02/22.
//

import UIKit

class DetailHistoryViewController: UIViewController {

    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPurchaseDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemName.text = globalBuyingHistory[selectedHistoryItem].name;
        itemPrice.text = String(globalBuyingHistory[selectedHistoryItem].totalPrice);
        itemQuantity.text = String(globalBuyingHistory[selectedHistoryItem].quantity);
        itemPurchaseDate.text = globalBuyingHistory[selectedHistoryItem].purchaseDate;
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

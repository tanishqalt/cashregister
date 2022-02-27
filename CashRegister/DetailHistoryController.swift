//
//  DetailHistoryController.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 27/02/22.
//

import UIKit

class DetailHistoryController: UIViewController {

    
    @IBOutlet weak var detailName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailName.text = globalBuyingHistory[selectedHistoryItem].name
    }


}

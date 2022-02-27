//
//  CustomTableView.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 27/02/22.
//

import UIKit

class CustomTableView: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var UnitPrice: UILabel!
    
    @IBOutlet weak var itemQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

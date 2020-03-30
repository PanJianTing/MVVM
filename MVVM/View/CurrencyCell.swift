//
//  CurrencyCell.swift
//  MVVM
//
//  Created by panjianting on 2020/3/28.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    weak var currencyLabel: UILabel!
    weak var rateLabel: UILabel!
    
    var currencyRate : CurrencyRate?{
        didSet{
            guard let currencyRate = currencyRate else {
                return
            }
            rateLabel.text = "\(currencyRate.rate)"
            currencyLabel.text = currencyRate.currencyIso
        }
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)

           // Configure the view for the selected state
       }

}

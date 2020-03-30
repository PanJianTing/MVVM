//
//  CurrencyDataSource.swift
//  MVVM
//
//  Created by panjianting on 2020/3/28.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class GenericDataSource<T>: NSObject {
    var data : DynamicValue<[T]> = DynamicValue([]);
}

class CurrencyDataSource : GenericDataSource<CurrencyRate>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        
        let currencyRate = self.data.value[indexPath.row];
        cell.currencyRate = currencyRate;
        
        return cell
    }
    

}

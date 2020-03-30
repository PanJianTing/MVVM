//
//  CurrencyViewModel.swift
//  MVVM
//
//  Created by panjianting on 2020/3/28.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

struct CurrencyViewModel {
    
    weak var dataSource : GenericDataSource<CurrencyRate>?
    weak var service : FileDataService?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(dataSource:GenericDataSource<CurrencyRate>?) {
        self.dataSource = dataSource
        self.service = FileDataService.shared;
    }
    
    func fetchCurrencies() {
        
        service?.fetchConverter({ (result) in
            DispatchQueue.main.async {
                switch result{
                case.success(let converter):
                    self.dataSource?.data.value = converter.rates
                case .failure(let error):
                    self.onErrorHandling?(error)
                }
            }
        })
    }
}

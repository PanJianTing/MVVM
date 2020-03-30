//
//  Converter.swift
//  MVVM
//
//  Created by panjianting on 2020/3/27.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit



struct Converter {
    let base : String;
    let date : String;
    
    let rates:[CurrencyRate];
}

extension Converter : Parceable{
    
    static func parseObject(dictionary: [String : AnyObject]) -> Result<Converter, ErrorResult> {
        if let base = dictionary["base"] as? String,
            let date = dictionary["data"] as? String,
            let rates = dictionary["rates"] as? [String: Double]{
            
            let finalRates : [CurrencyRate] = rates.map({
                CurrencyRate(currencyIso: $0.key, rate: $0.value)
                })
            
            let conversion = Converter(base: base, date: date, rates: finalRates)
            
            return .success(conversion);
        }else{
            return .failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
}

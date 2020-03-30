//
//  ErrorResult.swift
//  MVVM
//
//  Created by panjianting on 2020/3/27.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

enum ErrorResult:Error {
    case network(string : String);
    case parser(string : String);
    case custom(string : String)
}

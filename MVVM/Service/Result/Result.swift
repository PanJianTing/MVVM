//
//  Result.swift
//  MVVM
//
//  Created by panjianting on 2020/3/27.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit



enum Result<T, E:Error> {
    case success(T)
    case failure(E)
}

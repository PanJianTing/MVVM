//
//  DynamicValue.swift
//  MVVM
//
//  Created by panjianting on 2020/3/28.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class DynamicValue<T> {
    
    typealias CompletionHandle = ((T) -> Void)
    
    var value : T {
        didSet{
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandle]();
    
    init(_ value:T){
        self.value = value;
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandle){
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandle: @escaping CompletionHandle){
        self.addObserver(observer, completionHandler: completionHandle)
        self.notify();
    }
    
    private func notify(){
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll();
    }
    

}

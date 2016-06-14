//
//  Logger.swift
//  SportStore
//
//  Created by Leonardo Lobato on 6/14/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import Foundation

class Logger<T where T:NSObject, T:NSCopying>{
    var dataItems:[T] = []
    var callback:(T)->Void;
    
    init(callback:T -> Void){
        self.callback = callback
    }
    
    func logItem(item:T)  {
        dataItems.append(item.copy() as! T)
        callback(item)
    }
    
    func processItems(callback:T -> Void)  {
        for item in dataItems{
            callback(item)
        }
    }
    
}
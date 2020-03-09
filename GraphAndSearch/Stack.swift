//
//  Stack.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/9/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation


public struct Stack<Element> {
    
    private var storage : [Element] = []
    
    public mutating func push(_ elemant : Element) {
        storage.append(elemant)
    }
    
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public func isEmpty() -> Bool {
        return peek() == nil
    }
    
}

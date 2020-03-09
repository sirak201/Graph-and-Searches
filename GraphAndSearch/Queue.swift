//
//  Queue.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/9/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation

public protocol Queue {
    
    associatedtype Element
    
    
    mutating func enqueue(_ element : Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek : Element? {get }
    
    
}


public struct QueueArray<E> : Queue{
    public typealias Element = E
    private var storage = [E]()

    @discardableResult
    public mutating func enqueue(_ element: E) -> Bool {
        storage.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> E? {
        return  isEmpty ? nil :  storage.removeFirst()
    }
    
    public var isEmpty: Bool {
        return peek == nil
    }
    
    public var peek: E?  {
        return storage.first
    }
    
    
    
}

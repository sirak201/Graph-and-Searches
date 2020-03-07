//
//  Edge.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/6/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation


public enum EdgeType {
    case durected
    case undirected
}




public struct Vertex<T> {
    public let index : Int
    public let data : T
}

extension Vertex : Equatable where T: Equatable {}
extension Vertex : Hashable where T: Hashable  {}



public struct Edge<T> {
    public let source : Vertex<T>
    public let destination : Vertex<T>
    public let weight : Double?
}

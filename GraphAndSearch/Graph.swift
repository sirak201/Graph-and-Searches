//
//  Graph.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/6/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation


public protocol Graph {
    
    associatedtype Element
    
    func createVertex(data : Element) -> Vertex<Element>
    func addDirectionEdge(from source : Vertex<Element>,
                          to destination : Vertex<Element>,
                          weight : Double?)
    func addUndirected(between source : Vertex<Element>,
                       and destination : Vertex<Element>,
                       weight : Double?)
    func add(_ edge : EdgeType ,
             from source : Vertex<Element>,
             to destonation : Vertex<Element>,
             weight : Double?)
    
    func edges(from source : Vertex<Element>) -> [Edge<Element>]
    
    func weight(from source : Vertex<Element>,
                to destonation : Vertex<Element>) -> Double?
                        

}

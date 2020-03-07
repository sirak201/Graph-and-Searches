//
//  AdjacencyList.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/6/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation

class AdjacencyList<T : Hashable> : Graph {
    
    public var adjacencies : [Vertex<T> : [Edge<T>]] = [:]


    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectionEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    func addUndirected(between source: Vertex<T>, and destination: Vertex<T>, weight: Double?) {
            addDirectionEdge(from: source, to: destination, weight: weight)
            addDirectionEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, from source: Vertex<T>, to destonation: Vertex<T>, weight: Double?) {
        switch edge {
        case .durected:
            addDirectionEdge(from: source, to: destonation, weight: weight)
        case .undirected:
            addUndirected(between: source, and: destonation, weight: weight)
        }
    }
    
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destonation: Vertex<T>) -> Double? {
     
        return edges(from: source)
            .first { $0.destination == destinatio }?
            .weight
    }
    

    
    
    
}


extension AdjacencyList: CustomStringConvertible {
  public var description: String {
    var result = ""
    for (vertex, edges) in adjacencies { // 1
        var edgeString = ""
        for (index, edge) in edges.enumerated() { // 2
            if index != edges.count - 1 { edgeString.append("\(edge.destination), ")
            } else {
                edgeString.append("\(edge.destination)") }
            }
        result.append("\(vertex) ---> [ \(edgeString) ]\n") // 3 }
    
        }
    return result
}

}

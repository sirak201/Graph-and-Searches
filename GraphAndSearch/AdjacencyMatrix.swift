//
//  AdjacencyMatrix.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/6/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation

public class AdjacencyMatrix<T> : Graph{
    
    private var vertices : [Vertex<T>] = []
    private var weights : [[Double?]] = []

    public func addDirectionEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        
        weights[source.index][destination.index] = weight
    }
    
    
    public func addUndirected(between source: Vertex<T>, and destination: Vertex<T>, weight: Double?) {
        addDirectionEdge(from: source, to: destination, weight: weight)
        addDirectionEdge(from: destination, to: source, weight: weight)

    }
    
    
    public func add(_ edge: EdgeType, from source: Vertex<T>, to destonation: Vertex<T>, weight: Double?) {
        
        switch  edge {
        case .durected:
            addDirectionEdge(from: source, to: destonation, weight: weight)
        case .undirected:
            addUndirected(between: source, and: destonation, weight: weight)
        }
    }
    
    
    public func createVertex(data: T) -> Vertex<T> {

        let newVertex = Vertex(index: vertices.count, data: data)
        vertices.append(newVertex)
        
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        
        let newRow = Array<Double?>(repeating: nil, count: vertices.count)
        
        weights.append(newRow)
        

        return newVertex
    }
    
    public func weight(from source: Vertex<T>, to destonation: Vertex<T>) -> Double? {
        
        return weights[source.index][destonation.index]
        
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges = [Edge<T>]()
        
        for colum in 0..<weights.count {
            
            if let weight = weights[source.index][colum] {
                let edge = Edge(source: source, destination: vertices[colum] , weight: weight)
                edges.append(edge)
            }
        
        }
        return edges
    }
    
 
    
    
}


extension AdjacencyMatrix: CustomStringConvertible {
  public var description: String {
    // 1
    let verticesDescription = vertices.map { "\($0)" }.joined(separator: "\n")
    var grid: [String] = []
    for i in 0..<weights.count {
    var row = ""
    for j in 0..<weights.count {
        if let value = weights[i][j] {
          row += "\(value)\t"
    } else {
          row += "ø\t\t"
        }
    }
    grid.append(row) }
    let edgesDescription = grid.joined(separator: "\n") // 3
    return "\(verticesDescription)\n\n\(edgesDescription)"
    }
    
}

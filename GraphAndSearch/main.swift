//
//  main.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/6/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation


//let graph = AdjacencyList<String>()
//let singapore = graph.createVertex(data: "Singapore")
//let tokyo = graph.createVertex(data: "Tokyo")
//let hongKong = graph.createVertex(data: "Hong Kong")
//let detroit = graph.createVertex(data: "Detroit")
//let sanFrancisco = graph.createVertex(data: "San Francisco")
//let washingtonDC = graph.createVertex(data: "Washington DC")
//let austinTexas = graph.createVertex(data: "Austin Texas")
//let seattle = graph.createVertex(data: "Seattle")
//graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
//graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
//graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
//graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
//graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
//graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
//graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
//graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
//graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
//graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
//graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
//graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)


//print(graph.weight(from: singapore, to: hongKong))



let graph = AdjacencyMatrix<String>()
let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washingtonDC = graph.createVertex(data: "Washington DC")
let austinTexas = graph.createVertex(data: "Austin Texas")
let seattle = graph.createVertex(data: "Seattle")
graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

//print(graph)


let challageGraph = AdjacencyList<String>()
let a = challageGraph.createVertex(data: "A")
let b = challageGraph.createVertex(data: "B")
let c = challageGraph.createVertex(data: "C")
let d = challageGraph.createVertex(data: "D")
let e = challageGraph.createVertex(data: "E")
challageGraph.add(.durected, from: a, to: c, weight: nil)
challageGraph.add(.durected, from: a, to: b, weight: nil)
challageGraph.add(.durected, from: a, to: e, weight: nil)
challageGraph.add(.durected, from: a, to: d, weight: nil)
challageGraph.add(.durected, from: b, to: d, weight: nil)
challageGraph.add(.durected, from: b, to: c, weight: nil)
challageGraph.add(.durected, from: c, to: e, weight: nil)
challageGraph.add(.durected, from: d, to: e, weight: nil)



func getPathCount(_ graph : AdjacencyList<String> ,  _ source : Vertex<String> , _ destination : Vertex<String> ) -> Int {
    
    let edges = graph.edges(from: source)
    var holder = 0
    
    for i in edges {
        if i.destination == destination {
            holder += 1
        } else {
            holder += getPathCount(graph , i.destination, destination)
        }
    }

    return holder
}






//print(getPathCount(challageGraph, a, e))

var myset = Set<Vertex<String>>()
let verticles = challageGraph.recuresiveBFS(from: a, enquied: &myset)


verticles.forEach { vertex in
    
    print(vertex)
    
}




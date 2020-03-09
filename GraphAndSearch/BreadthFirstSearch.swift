//
//  BreadthFirstSearch.swift
//  GraphAndSearch
//
//  Created by Sirak on 3/9/20.
//  Copyright © 2020 Sirak. All rights reserved.
//

import Foundation


extension Graph where Element : Hashable {
    
    
    func breadthFirstSearch(from source : Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueArray<Vertex<Element>>()
        var enqueued : Set<Vertex<Element>> = []
        var visited : [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            let neighours = edges(from: vertex)
            
            neighours.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        
        
        return visited
    }
    
    func recuresiveBFS(from source : Vertex<Element> , enquied : inout Set<Vertex<Element>>) -> [Vertex<Element>] {
        var visited = [Vertex<Element>]()

        enquied.insert(source)

            visited.append(source)
            let neighours = edges(from: source)
            
            neighours.forEach { edge in
                
                if !enquied.contains(edge.destination) {
                    visited.append(contentsOf: recuresiveBFS(from: edge.destination, enquied: &enquied))
                }
                
            }
            

        

        return visited
    }

    
    
    
}


//
//  Recipe.swift
//  hello-vapor
//
//  Created by Mohammad Azam on 10/21/16.
//
//

import Fluent
import Foundation

class Recipe : NodeRepresentable {
    
    var name :String! 
  
    init(name :String) {
        self.name = name
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "name":self.name], in: context)
    }
    
}

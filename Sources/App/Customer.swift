//
//  Customer.swift
//  hello-vapor
//
//  Created by Mohammad Azam on 10/21/16.
//
//

import Fluent
import Foundation

class Customer : NodeRepresentable {

    var title: String!
    var content :String!
    var tags :[String]!

    init(title :String,content :String, tags :[String]) {
        self.title = title
        self.content = content
        self.tags = tags
    }
    
    func makeNode(context: Context) throws -> Node {
        
        return try Node(node: ["title":self.title,"content":self.content,"tags":try tags.makeNode()], in: context)
    }
    
    
}

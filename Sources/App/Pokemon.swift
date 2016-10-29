//
//  Pokemon.swift
//  hello-vapor
//
//  Created by Mohammad Azam on 10/26/16.
//
//

import Fluent
import Vapor
import Foundation
import HTTP

struct Pokemon : NodeRepresentable, ResponseRepresentable {
    
    var id :Int?
    var name :String
    var imageURL :String
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "name":self.name,
            "imageURL":self.imageURL,
            "id":self.id
            
            ], in: context)
    }
    
    func makeResponse() throws -> Response {
        
        let json = try JSON(node:
            [
                "id": id,
                "name": name,
                "imageURL": imageURL
            ]
        )
        
        return try json.makeResponse()
    }
}

extension Pokemon {
    
    init?(content :Content) {
       
        guard let name = content["name"]?.string!,
        let imageURL = content["imageURL"]?.string!
        
        else {
            return nil
        }
        
        self.name = name
        self.imageURL = imageURL
    }
    
}





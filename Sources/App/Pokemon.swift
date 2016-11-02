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
    var latitude :Double = 36.421412  // The Iron Yard Latitude
    var longitude :Double = -116.419681 // The Iron Yard Longitude
    
    init(id :Int?, name: String, imageURL :String) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "name":self.name,
            "imageURL":self.imageURL,
            "id":self.id,
            "latitude":self.latitude,
            "longitude":self.longitude
            
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
       
        guard let name = content["name"]!.string,
        let imageURL = content["imageURL"]!.string,
        let latitude = content["latitude"]!.double,
        let longitude = content["longitude"]!.double
        
        else {
            return nil
        }
        
        self.name = name
        self.imageURL = imageURL
        self.latitude = latitude
        self.longitude = longitude
    }
    
}





//
//  Array+Extensions.swift
//  hello-vapor
//
//  Created by Mohammad Azam on 10/21/16.
//
//

import Foundation

extension Array {
    
    func toDictionary() -> [Int:Element] {
        
        var result :[Int:Element] = [:]
        enumerated().forEach({
            result[$0.offset] = $0.element
        })
        
        return result
       
        
    }
    
}

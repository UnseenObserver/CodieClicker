//
//  part.swift
//  CodieClicker
//
//  Created by HPro2 on 5/15/25.
//

import SwiftUI
import SwiftData

@Model
class Part: Hashable {
    
    var name: String
    var function: String
    var price: Int
    var id: Int
    
    init(name: String, function: String, price: Int, id: Int) {
        self.name = name
        self.function = function
        self.price = price
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

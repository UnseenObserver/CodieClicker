//
//  upgrade.swift
//  CodieClicker
//
//  Created by HPro2 on 5/15/25.
//

import SwiftUI
import SwiftData

@Model
class Upgrade: Hashable {
    
    var name: String
    var add: Bool
    var value: Double
    var price: Int
    var id: Int
    var type: String
    var strength: Int
    
    init(name: String, add: Bool, value: Double, price: Int, id: Int, type: String, strength: Int) {
        self.name = name
        self.add = add
        self.value = value
        self.price = price
        self.id = id
        self.type = type
        self.strength = strength
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

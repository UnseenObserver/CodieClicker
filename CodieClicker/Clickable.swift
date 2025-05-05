//
//  Clickable.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import Foundation
import SwiftUICore
import SwiftData

@Model
class Clickable: ObservableObject {
    var amountOfData: Int
    var upgradeAdd: Int
    var upgradeMult: Int
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    var colorOfClicker: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    init(amountOfData: Int, upgradeAdd: Int, upgradeMult: Int, red: Double, green: Double, blue: Double, alpha: Double) {
        self.amountOfData = amountOfData
        self.upgradeAdd = upgradeAdd
        self.upgradeMult = upgradeMult
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    init() {
        self.amountOfData = 0
        self.upgradeAdd = 1
        self.upgradeMult = 1
        self.red = 0
        self.green = 0
        self.blue = 0.5
        self.alpha = 1
    }
    
    func click() {
        amountOfData = amountOfData + (upgradeAdd * upgradeMult)
    }
    
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // skip the #
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

//
//  UpgradeView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct UpgradeView: View {
    let myDefaults = UserDefaults(suiteName: "com.jonesclass.pawloski.codieclicker")
    
    @ObservedObject var clicker: Clickable
    @Binding var autoClickerON: Bool
    @Environment(\.modelContext) var modelContext
    
    @State var upgrades: [String:Upgrade] = [
        "Add1" :Upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add2" :Upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add3" :Upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult2" :Upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 3),
        "Add10" :Upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 4),
        "Add20" :Upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 5),
        "Add30" :Upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 6),
        "Mult20" :Upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 7),
        "Add11" :Upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 8),
        "Add21" :Upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 9),
        "Add31" :Upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 10),
        "Mult21" :Upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 11),
        "Add12" :Upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 12),
        "Add22" :Upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 13),
        "Add33" :Upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 14),
        "Mult24" :Upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 15),
        "Add15" :Upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 16),
        "Add26" :Upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 17),
        "Add37" :Upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 18),
        "Mult27" :Upgrade(name: "Multi 2", add: false, value: 100000, price: 20, id: 19)]
    
    @State var parts: [String:Part] = [
        "aC" :Part(name: "Auto Clicker", function: "autoClicker", price: 100, id: 0)
    ]
    
    var upgradesAvaliable: [String] {
        upgrades.keys
            .sorted()
    }
    
    var partsAvaliable: [String] {
        parts.keys
            .sorted()
    }
    
    
    var body: some View {
        HStack{
            VStack{
                List {
                    if upgradesAvaliable.isEmpty && partsAvaliable.isEmpty {
                        Text("No more Upgrades!")
                    } else {
                        Section("Parts") {
                            ForEach(partsAvaliable, id: \.self) { key in
                                partCell(part: parts[key]!)
                                    .onTapGesture {
                                        if buyCheck(clicker: clicker, upgrade: nil,part: parts[key]!) {
                                            switch parts[key]!.function {
                                            case "autoClicker":
                                                autoClickerON = true
                                            default:
                                                Text("Error")
                                            }
                                            parts.removeValue(forKey: key)
                                        } else {
                                            
                                        }
                                        try? modelContext.save()
                                    }
                            }
                        }
                        Section("Upgrades") {
                            ForEach(upgradesAvaliable, id: \.self) { key in
                                upgradeCell(upgrade: upgrades[key]!)
                                    .onTapGesture {
                                        if buyCheck(clicker: clicker, upgrade: upgrades[key]!, part: nil) {
                                            if upgrades[key]!.add == true {
                                                clicker.upgradeAdd += upgrades[key]!.value
                                            } else {
                                                clicker.upgradeMult += upgrades[key]!.value
                                            }
                                            upgrades.removeValue(forKey: key)
                                        } else {
                                            
                                        }
                                        try? modelContext.save()
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func buyCheck(clicker: Clickable, upgrade: Upgrade?, part: Part?) -> Bool {
        var shoudlBuy: Bool = false
        
        if upgrade != nil {
            if clicker.amountOfData >= upgrade!.price {
                clicker.amountOfData = clicker.amountOfData - upgrade!.price
                shoudlBuy = true
            }
        } else if part != nil {
            if clicker.amountOfData >= part!.price {
                clicker.amountOfData = clicker.amountOfData - part!.price
                shoudlBuy = true
            }
        }
        
        return shoudlBuy
    }
}

//
//  UpgradeView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct UpgradeView: View {
    @ObservedObject var clicker: Clickable
    @Binding var autoClickerON: Bool
    
    @State var upgrades: [String:upgrade] = [
        "Add1" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add2" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add3" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult2" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 3),
        "Add10" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 4),
        "Add20" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 5),
        "Add30" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 6),
        "Mult20" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 7),
        "Add11" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 8),
        "Add21" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 9),
        "Add31" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 10),
        "Mult21" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 11),
        "Add12" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 12),
        "Add22" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 13),
        "Add33" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 14),
        "Mult24" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 15),
        "Add15" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 16),
        "Add26" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 17),
        "Add37" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 18),
        "Mult27" :upgrade(name: "Multi 2", add: false, value: 100000, price: 20, id: 19)]
    
    @State var parts: [String:part] = [
        "aC" :part(name: "Auto Clicker", function: "autoClicker", price: 100, id: 0)
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
                                        if clicker.amountOfData >= parts[key]!.price {
                                            clicker.amountOfData = clicker.amountOfData - parts[key]!.price
                                            switch parts[key]!.function {
                                            case "autoClicker":
                                                autoClickerON = true
                                            default:
                                                Text("Error")
                                            }
                                            parts.removeValue(forKey: key)
                                        } else {
                                            
                                        }
                                    }
                            }
                        }
                        Section("Upgrades") {
                            ForEach(upgradesAvaliable, id: \.self) { key in
                                upgradeCell(upgrade: upgrades[key]!)
                                    .onTapGesture {
                                        if clicker.amountOfData >= upgrades[key]!.price {
                                            clicker.amountOfData = clicker.amountOfData - upgrades[key]!.price
                                            if upgrades[key]!.add == true {
                                                clicker.upgradeAdd += upgrades[key]!.value
                                            } else {
                                                clicker.upgradeMult += upgrades[key]!.value
                                            }
                                            upgrades.removeValue(forKey: key)
                                        } else {
                                            
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

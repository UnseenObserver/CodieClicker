//
//  UpgradeView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct upgrade: Hashable {
    
    var name: String
    var add: Bool
    var value: Double
    var price: Int
    var id: Int
    
    init(name: String, add: Bool, value: Double, price: Int, id: Int) {
        self.name = name
        self.add = add
        self.value = value
        self.price = price
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

struct UpgradeView: View {
    @ObservedObject var clicker: Clickable
    @State var upgrades: [String:upgrade] = [
        "Add1" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add2" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add3" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult2" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 3),
        "Add10" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add20" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add30" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult20" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 3),
        "Add11" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add21" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add31" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult21" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 3),
        "Add12" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add22" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add33" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult24" :upgrade(name: "Multi 2", add: false, value: 4, price: 20, id: 3),
        "Add15" :upgrade(name: "Add 1", add: true, value: 1, price: 10, id: 0),
        "Add26" :upgrade(name: "Add 2", add: true, value: 2, price: 10, id: 1),
        "Add37" :upgrade(name: "Add 3", add: true, value: 3, price: 10, id: 2),
        "Mult27" :upgrade(name: "Multi 2", add: false, value: 100000, price: 20, id: 3)]
    @Binding var autoClickerON: Bool
    var upgradesAvaliable: [String] {
        upgrades.keys
            .sorted()
    }
    
    
    var body: some View {
        HStack{
            VStack{
                List {
                    if upgradesAvaliable.isEmpty {
                        Text("No more Upgrades!")
                    } else {
                        ForEach(upgradesAvaliable, id: \.self) { key in
                            upgradeCell(upgrade: upgrades[key]!, price: upgrades[key]!.price)
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

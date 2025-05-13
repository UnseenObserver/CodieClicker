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
    var value: Int
    var price: Int
    
    init(name: String, add: Bool, value: Int, price: Int) {
        self.name = name
        self.add = add
        self.value = value
        self.price = price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

struct UpgradeView: View {
    @ObservedObject var clicker: Clickable
    @State var upgradesAvaliable: [upgrade] = []
    @Binding var autoClickerON: Bool
    
    
    var body: some View {
        HStack{
            VStack{
                List {
                    ForEach(upgradesAvaliable, id: \.self) { upgrade in
                        upgradeCell(upgrade: upgrade, price: upgrade.price)
                    }
                }
            }
        }
        .onAppear() {
            makeArray()
        }
    }
    
    func makeArray() {
        upgradesAvaliable = [upgrade(name: "Add 1", add: true, value: 1, price: 10), upgrade(name: "Add 2", add: true, value: 2, price: 10), upgrade(name: "Add 3", add: true, value: 3, price: 10), upgrade(name: "Multi 2", add: false, value: 2, price: 20)]
    }
}

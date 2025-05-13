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
    
    init(name: String, add: Bool, value: Int) {
        self.name = name
        self.add = add
        self.value = value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

struct UpgradeView: View {
    @ObservedObject var clicker: Clickable
    @State var upgradesAvaliable: [upgrade] = []
    
    
    var body: some View {
        HStack{
            VStack{
                List {
                    ForEach(upgradesAvaliable, id: \.self) { upgrade in
                        Button(upgrade.name) {
                            if upgrade.add {
                                clicker.upgradeAdd += upgrade.value
                            } else {
                                clicker.upgradeMult += upgrade.value
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            makeArray()
        }
    }
    
    func makeArray() {
        upgradesAvaliable = [upgrade(name: "Add 1", add: true, value: 1), upgrade(name: "Add 2", add: true, value: 2), upgrade(name: "Add 3", add: true, value: 3)]
    }
}

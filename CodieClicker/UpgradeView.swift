//
//  UpgradeView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct upgrade {
    var name: String
    var add: Bool
    var value: Int
    
    init(name: String, add: Bool, value: Int) {
        self.name = name
        self.add = add
        self.value = value
    }
    
}

struct UpgradeView: View {
    @ObservedObject var clicker: Clickable
    var upgradesAvaliable: [upgrade] = [upgrade(name: "Add 1", add: true, value: 1), upgrade(name: "Add 2", add: true, value: 2)]
    
    
    var body: some View {
        HStack{
            VStack{
                List {
                    
                }
            }
        }
    }
}

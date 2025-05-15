//
//  upgradeCell.swift
//  CodieClicker
//
//  Created by HPro2 on 5/13/25.
//

import SwiftUICore

struct upgradeCell: View {
    var upgrade: Upgrade
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                if upgrade.add {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                } else {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                }
                Text(upgrade.name)
            }
            Spacer()
            VStack {
                if upgrade.add {
                    Text("Add")
                } else {
                    Text("Multiply")
                }
                Text(String(upgrade.value))
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(String("\(upgrade.price)dP"))
            }
        }
        .frame(height: 100)
    }
}



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
                    Image(picChange(upgrade: upgrade))
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                } else {
                    Image(picChange(upgrade: upgrade))
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                }
                Text(upgrade.name)
                    .scaledToFit()
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
                Text(String("\(upgrade.price.formatted(.number.notation(.compactName))) dP"))
            }
        }
        .frame(width: 230, height: 100)
    }
    
    func picChange(upgrade: Upgrade) -> String {
        switch upgrade.type {
        case "CPU":
            return "cpu\(upgrade.strength)Pic"
        case "GPU":
            return "gpu\(upgrade.strength)Pic"
        case "RAM":
            return "ram\(upgrade.strength)Pic"
        case "HRD":
            return "hardDrive\(upgrade.strength)Pic"
        case "PWS":
            return "powerSupply\(upgrade.strength)Pic"
        case "MTB":
            return "motherBoard\(upgrade.strength)Pic"
        case "RUB":
            return "rubberDuck\(upgrade.strength)Pic"
        case "SSD":
            return "ssd\(upgrade.strength)Pic"
        default:
            return "error"
        }
    }
    
}



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
    @Environment(\.modelContext) var modelContext
    @AppStorage("partsString") var partsString: String?
    @AppStorage("upgradesString") var upgradesString: String?
    
    @State var upgrades: [String:Upgrade] = [
            "AACPU1" :Upgrade(name: "Rinky-Dink CPU", add: true, value: 1, price: 10, id: 0),
            "ABCPU2" :Upgrade(name: "Nice CPU", add: true, value: 5, price: 750, id: 1),
            "ACCPU3" :Upgrade(name: "Lovely CPU", add: true, value: 100, price: 25000, id: 2),
            "ADCPU4" :Upgrade(name: "Premium ", add: true, value: 4, price: 42000000, id: 3),
        
            "AEGPU1" :Upgrade(name: "Rinky-Dink GPU", add: false, value: 1, price: 1000, id: 4),
            "AFGPU2" :Upgrade(name: "Nice GPU", add: false, value: 2, price: 42000000, id: 5),
            "AGGPU3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 6),
            "AHGPU4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 7),
            
            "AISSD1" :Upgrade(name: "Rinky-Dink SSD", add: true, value: 2, price: 75, id: 8),
            "AJSSD2" :Upgrade(name: "Nice SSD", add: true, value: 10, price: 1500, id: 9),
            "AKSSD3" :Upgrade(name: "Lovely SSD", add: true, value: 200, price: 75000, id: 10),
            "ALSSD4" :Upgrade(name: "Multi 2", add: true, value: 4, price: 42000000, id: 11),
            
            "AMRAM1" :Upgrade(name: "Rinky-Dink RAM", add: false, value: 1, price: 5000, id: 12),
            "ANRAM2" :Upgrade(name: "Add 2", add: false, value: 2, price: 42000000, id: 13),
            "AORAM3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 14),
            "APRAM4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 15),
            
            "AQhardDrive1" :Upgrade(name: "Rinky-Dink Hard Drive", add: true, value: 3, price: 250, id: 16),
            "ARhardDrive2" :Upgrade(name: "Nice Hard Drive", add: true, value: 15, price: 7500, id: 17),
            "AShardDrive3" :Upgrade(name: "Lovely Hard Drive", add: true, value: 300, price: 100000, id: 18),
            "AThardDrive4" :Upgrade(name: "Multi 2", add: true, value: 100000, price: 42000000, id: 19),
            
            "AUpowerSupply1" :Upgrade(name: "Rinky-Dink Power Supply", add: false, value: 1, price: 10000, id: 20),
            "AVpowerSupply2" :Upgrade(name: "Add 2", add: false, value: 2, price: 42000000, id: 21),
            "AWpowerSupply3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 22),
            "AXpowerSupply4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 23),
            
            "AYmotherBoard1" :Upgrade(name: "Rinky-Dink Mother Board", add: true, value: 4, price: 500, id: 24),
            "AZmotherBoard2" :Upgrade(name: "Nice Mother Board", add: true, value: 20, price: 15000, id: 25),
            "BAmotherBoard3" :Upgrade(name: "Lovely Mother Board", add: true, value: 400, price: 150000, id: 26),
            "BBmotherBoard4" :Upgrade(name: "Multi 2", add: true, value: 4, price: 42000000, id: 27),
            
            "BCduck1" :Upgrade(name: "Rinky-Dink Rubber Duck", add: false, value: 1, price: 20000, id: 28),
            "BDduck2" :Upgrade(name: "Add 2", add: false, value: 2, price: 42000000, id: 29),
            "BEduck3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 30),
            "BFduck4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 31)
        ]
        
        @State var parts: [String:Part] = [
            "aC" :Part(name: "Auto Clicker", function: "autoClicker", price: 50000, id: 0)
        ]
    
    var upgradesAvaliable: [String] {
        if let upgradesArrayString = upgradesString {
            upgradesArrayString.components(separatedBy: ",")
        } else {
            upgrades.keys.sorted()
        }
    }
    
    var partsAvaliable: [String] {
        if let partsArrayString = partsString {
            partsArrayString.components(separatedBy: ",")
        } else {
            parts.keys.sorted()
        }
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
                                            partsString = partsAvaliable.joined(separator: ",")
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

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

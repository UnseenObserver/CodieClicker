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
    @Binding var autoSave: Bool
    @Binding var autoClickerON: Bool
    @Binding var holdOn: Bool
    @Environment(\.modelContext) var modelContext
    @AppStorage("partsString") var partsString: String?
    @AppStorage("upgradesString") var upgradesString: String?
    @Binding var cpuType: String
    @Binding var gpuType: String
    @Binding var ramType: String
    @Binding var motherBoardType: String
    @Binding var powerSupplyType: String
    @Binding var hardDriveType: String
    @Binding var rubberDuckType: String
    @Binding var calcEquaion: String
    @State var C: String = "1"
    @State var M: String = "0"
    @State var H: String = "0"
    @State var G: String = "1"
    @State var R: String = "0"
    @State var P: String = "0"
    
    //        Theo Notes 🐶!
    //        I would make it so that all first strength items get purchesed befor upgrading
    //        The second ugrade takes way to long, so either make it cheaper or make the autoClicker cheaper
    //        When the assets are done the pictures should already have a system to work
    
    @State var upgrades: [String:Upgrade] = [
        "AACPU1" :Upgrade(name: "Rinky-Dink CPU", add: true, value: 1, price: 10, id: 0, type: "CPU", strength: 0),
        "ABCPU2" :Upgrade(name: "Nice CPU", add: true, value: 5, price: 750, id: 1, type: "CPU", strength: 1),
        "ACCPU3" :Upgrade(name: "Lovely CPU", add: true, value: 100, price: 25000, id: 2, type: "CPU", strength: 2),
        "ADCPU4" :Upgrade(name: "Premium ", add: true, value: 4, price: 42000000, id: 3, type: "CPU", strength: 3),
        
        "AEGPU1" :Upgrade(name: "Rinky-Dink GPU", add: false, value: 1, price: 1000, id: 4, type: "GPU", strength: 0),
        "AFGPU2" :Upgrade(name: "Nice GPU", add: false, value: 2, price: 42000000, id: 5, type: "GPU", strength: 1),
        "AGGPU3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 6, type: "GPU", strength: 2),
        "AHGPU4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 7, type: "GPU", strength: 3),
        
        "AISSD1" :Upgrade(name: "Rinky-Dink SSD", add: true, value: 2, price: 75, id: 8, type: "SSD", strength: 0),
        "AJSSD2" :Upgrade(name: "Nice SSD", add: true, value: 10, price: 1500, id: 9, type: "SSD", strength: 1),
        "AKSSD3" :Upgrade(name: "Lovely SSD", add: true, value: 200, price: 75000, id: 10, type: "SSD", strength: 2),
        "ALSSD4" :Upgrade(name: "Multi 2", add: true, value: 4, price: 42000000, id: 11, type: "SSD", strength: 3),
        
        "AMRAM1" :Upgrade(name: "Rinky-Dink RAM", add: false, value: 1, price: 5000, id: 12, type: "RAM", strength: 0),
        "ANRAM2" :Upgrade(name: "Add 2", add: false, value: 2, price: 42000000, id: 13, type: "RAM", strength: 1),
        "AORAM3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 14, type: "RAM", strength: 2),
        "APRAM4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 15, type: "RAM", strength: 3),
        
        "AQhardDrive1" :Upgrade(name: "Rinky-Dink Hard Drive", add: true, value: 3, price: 250, id: 16, type: "HRD", strength: 0),
        "ARhardDrive2" :Upgrade(name: "Nice Hard Drive", add: true, value: 15, price: 7500, id: 17, type: "HRD", strength: 1),
        "AShardDrive3" :Upgrade(name: "Lovely Hard Drive", add: true, value: 300, price: 100000, id: 18, type: "HRD", strength: 2),
        "AThardDrive4" :Upgrade(name: "Multi 2", add: true, value: 100000, price: 42000000, id: 19, type: "HRD", strength: 3),
        
        "AUpowerSupply1" :Upgrade(name: "Rinky-Dink Power Supply", add: false, value: 1, price: 10000, id: 20, type: "PWS", strength: 0),
        "AVpowerSupply2" :Upgrade(name: "Add 2", add: false, value: 2, price: 42000000, id: 21, type: "PWS", strength: 1),
        "AWpowerSupply3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 22, type: "PWS", strength: 2),
        "AXpowerSupply4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 23, type: "PWS", strength: 3),
        
        "AYmotherBoard1" :Upgrade(name: "Rinky-Dink Mother Board", add: true, value: 4, price: 500, id: 24, type: "MTB", strength: 0),
        "AZmotherBoard2" :Upgrade(name: "Nice Mother Board", add: true, value: 20, price: 15000, id: 25, type: "MTB", strength: 1),
        "BAmotherBoard3" :Upgrade(name: "Lovely Mother Board", add: true, value: 400, price: 150000, id: 26, type: "MTB", strength: 2),
        "BBmotherBoard4" :Upgrade(name: "Multi 2", add: true, value: 4, price: 42000000, id: 27, type: "MTB", strength: 3),
        
        "BCduck1" :Upgrade(name: "Rinky-Dink Rubber Duck", add: false, value: 1, price: 20000, id: 28, type: "RUB", strength: 0),
        "BDduck2" :Upgrade(name: "Add 2", add: false, value: 2, price: 42000000, id: 29, type: "RUB", strength: 1),
        "BEduck3" :Upgrade(name: "Add 3", add: false, value: 1, price: 42000000, id: 30, type: "RUB", strength: 2),
        "BFduck4" :Upgrade(name: "Multi 2", add: false, value: 1, price: 42000000, id: 31, type: "RUB", strength: 3)
    ]
    
    @State var parts: [String:Part] = [
        "aC" :Part(name: "Auto Clicker", function: "autoClicker", price: 50000, id: 0),
        "hC" :Part(name: "Hold to Click", function: "hold", price: 50000, id: 1)
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
                                            case "hold":
                                                holdOn = true
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
                                            picChange(upgrade: upgrades[key]!)
                                            upgrades.removeValue(forKey: key)
                                            upgradesString = upgradesAvaliable.joined(separator: ",")
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
        .onChange(of: autoSave) {
            partsString = partsAvaliable.joined(separator: ",")
            upgradesString = upgradesAvaliable.joined(separator: ",")
            calcEquaion = "(\(C) + \(M) + \(H)) × (\(G) + \(R) + \(P))"
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
    
    func picChange(upgrade: Upgrade) {
        switch upgrade.type {
        case "CPU":
            cpuType = "cpu\(upgrade.strength)Pic"
            C = upgrade.value.formatted(.number.notation(.compactName))
        case "GPU":
            gpuType = "gpu\(upgrade.strength)Pic"
            G = upgrade.value.formatted(.number.notation(.compactName))
        case "RAM":
            ramType = "ram\(upgrade.strength)Pic"
            R = upgrade.value.formatted(.number.notation(.compactName))
        case "HRD":
            hardDriveType = "cpu\(upgrade.strength)Pic"
            H = upgrade.value.formatted(.number.notation(.compactName))
        case "PWS":
            powerSupplyType = "powerSupply\(upgrade.strength)Pic"
            P = upgrade.value.formatted(.number.notation(.compactName))
        case "MTB":
            motherBoardType = "motherBoard\(upgrade.strength)Pic"
            M = upgrade.value.formatted(.number.notation(.compactName))
        case "RUB":
            rubberDuckType = "rubberDuck\(upgrade.strength)Pic"
        default:
            Text("Error")
        }
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

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
    @Binding var ssdType: String
    @Binding var rubberDuckType: String
    @Binding var calcEquaion: String
    @State var C: String = "1"
    @State var M: String = "0"
    @State var H: String = "0"
    @State var G: String = "1"
    @State var R: String = "0"
    @State var P: String = "0"
    @State var S: String = "0"
    
    //        Theo Notes 🐶!
    //        I would make it so that all first strength items get purchesed befor upgrading
    //        The second ugrade takes way to long, so either make it cheaper or make the autoClicker cheaper
    //        When the assets are done the pictures should already have a system to work
    
    @State var upgrades: [String:Upgrade] = [
        "ACPU1" :Upgrade(name: "CPU", add: true, value: 1, price: 10, id: 0, type: "CPU", strength: 0),
        "BCPU2" :Upgrade(name: "CPU", add: true, value: 5, price: 750, id: 1, type: "CPU", strength: 1),
        "CCPU3" :Upgrade(name: "CPU", add: true, value: 100, price: 25000, id: 2, type: "CPU", strength: 2),
        "DCPU4" :Upgrade(name: "CPU", add: true, value: 1000, price: 10000000, id: 3, type: "CPU", strength: 3),
        
        "AGPU1" :Upgrade(name: "GPU", add: false, value: 1, price: 500, id: 4, type: "GPU", strength: 0),
        "BGPU2" :Upgrade(name: "GPU", add: false, value: 2, price: 50000, id: 5, type: "GPU", strength: 1),
        "CGPU3" :Upgrade(name: "GPU", add: false, value: 5, price: 100000, id: 6, type: "GPU", strength: 2),
        "DGPU4" :Upgrade(name: "GPU", add: false, value: 10, price: 1000000, id: 7, type: "GPU", strength: 3),
        
        "ASSD1" :Upgrade(name: "SSD", add: true, value: 2, price: 75, id: 8, type: "SSD", strength: 0),
        "BSSD2" :Upgrade(name: "SSD", add: true, value: 10, price: 1500, id: 9, type: "SSD", strength: 1),
        "CSSD3" :Upgrade(name: "SSD", add: true, value: 200, price: 75000, id: 10, type: "SSD", strength: 2),
        "DSSD4" :Upgrade(name: "SSD", add: true, value: 10000, price: 20000000, id: 11, type: "SSD", strength: 3),
        
        "ARAM1" :Upgrade(name: "RAM", add: false, value: 1, price: 5000, id: 12, type: "RAM", strength: 0),
        "BRAM2" :Upgrade(name: "RAM", add: false, value: 2, price: 150000, id: 13, type: "RAM", strength: 1),
        "CRAM3" :Upgrade(name: "RAM", add: false, value: 5, price: 300000, id: 14, type: "RAM", strength: 2),
        "DRAM4" :Upgrade(name: "RAM", add: false, value: 10, price: 42000000, id: 15, type: "RAM", strength: 3),
        
        "AhardDrive1" :Upgrade(name: "Hard Drive", add: true, value: 3, price: 250, id: 16, type: "HRD", strength: 0),
        "BhardDrive2" :Upgrade(name: "Hard Drive", add: true, value: 15, price: 7500, id: 17, type: "HRD", strength: 1),
        "ChardDrive3" :Upgrade(name: "Hard Drive", add: true, value: 300, price: 100000, id: 18, type: "HRD", strength: 2),
        "DhardDrive4" :Upgrade(name: "Hard Drive", add: true, value: 100000, price: 30000000, id: 19, type: "HRD", strength: 3),
        
        "ApowerSupply1" :Upgrade(name: "Power Supply", add: false, value: 1, price: 10000, id: 20, type: "PWS", strength: 0),
        "BpowerSupply2" :Upgrade(name: "Power Supply", add: false, value: 2, price: 200000, id: 21, type: "PWS", strength: 1),
        "CpowerSupply3" :Upgrade(name: "Power Supply", add: false, value: 5, price: 400000, id: 22, type: "PWS", strength: 2),
        "DpowerSupply4" :Upgrade(name: "Power Supply", add: false, value: 10, price: 42000000, id: 23, type: "PWS", strength: 3),
        
        "AmotherBoard1" :Upgrade(name: "Mother Board", add: true, value: 4, price: 500, id: 24, type: "MTB", strength: 0),
        "BmotherBoard2" :Upgrade(name: "Mother Board", add: true, value: 20, price: 15000, id: 25, type: "MTB", strength: 1),
        "CmotherBoard3" :Upgrade(name: "Mother Board", add: true, value: 400, price: 150000, id: 26, type: "MTB", strength: 2),
        "DmotherBoard4" :Upgrade(name: "Mother Board", add: true, value: 1000000, price: 40000000, id: 27, type: "MTB", strength: 3),
        
        "Aduck1" :Upgrade(name: "Rubber Duck", add: false, value: 1, price: 20000, id: 28, type: "RUB", strength: 0),
        "Bduck2" :Upgrade(name: "Rubber Duck", add: false, value: 2, price: 300000, id: 29, type: "RUB", strength: 1),
        "Cduck3" :Upgrade(name: "Rubber Duck", add: false, value: 5, price: 600000, id: 30, type: "RUB", strength: 2),
        "Dduck4" :Upgrade(name: "Byron Duck Jr.", add: false, value: 10, price: 42000000, id: 31, type: "RUB", strength: 3)
    ]
    
    @State var parts: [String:Part] = [
        "aC" :Part(name: "Auto Clicker", function: "autoClicker", price: 50000, id: 00),
        "hC" :Part(name: "Hold to Click", function: "hold", price: 10000, id: 01)
    ]
    
    @State var upgradesAvaliable: [String] = [""]
    
    @State var partsAvaliable: [String] = [""]
    
    var body: some View {
        HStack{
            VStack {
                List {
                    if upgradesAvaliable.isEmpty && partsAvaliable.isEmpty {
                        Text("No more Upgrades!")
                    } else {
                        Section("Parts") {
                            ForEach(partsAvaliable, id: \.self) { key in
                                if let part = parts[key] {
                                    partCell(part: part)
                                        .onTapGesture {
                                            if buyCheck(clicker: clicker, upgrade: nil, part: part) {
                                                switch part.function {
                                                case "autoClicker":
                                                    autoClickerON = true
                                                case "hold":
                                                    holdOn = true
                                                default:
                                                    Text("Error")
                                                }
                                                arrayFix(type: "part", key: key)
                                            } else {
                                                
                                            }
                                            try? modelContext.save()
                                        }
                                }
                            }
                        }
                        Section("Rinky-Dink") {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(upgradesAvaliable, id: \.self) { key in
                                        if let upgrade = upgrades[key] {
                                            if Array(key)[0] == "A" {
                                                upgradeCell(upgrade: upgrade)
                                                    .onTapGesture {
                                                        if buyCheck(clicker: clicker, upgrade: upgrade, part: nil) {
                                                            if upgrade.add == true {
                                                                clicker.upgradeAdd += upgrade.value
                                                            } else {
                                                                clicker.upgradeMult += upgrade.value
                                                            }
                                                            picChange(upgrade: upgrade)
                                                            upgrades.removeValue(forKey: key)
                                                            upgradesString = upgradesAvaliable.joined(separator: ",")
                                                        } else {
                                                            
                                                        }
                                                        try? modelContext.save()
                                                    }
                                                    .padding(.trailing, 20)
                                                    .padding(.leading, 20)
                                                Divider()
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                        .listRowBackground(Color("RinkyDink"))
                        Section("Nice") {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(upgradesAvaliable, id: \.self) { key in
                                        if let upgrade = upgrades[key] {
                                            if Array(key)[0] == "B" {
                                                upgradeCell(upgrade: upgrade)
                                                    .onTapGesture {
                                                        if buyCheck(clicker: clicker, upgrade: upgrade, part: nil) {
                                                            if upgrade.add == true {
                                                                clicker.upgradeAdd += upgrade.value
                                                            } else {
                                                                clicker.upgradeMult += upgrade.value
                                                            }
                                                            picChange(upgrade: upgrade)
                                                            upgrades.removeValue(forKey: key)
                                                            upgradesString = upgradesAvaliable.joined(separator: ",")
                                                        } else {
                                                            
                                                        }
                                                        try? modelContext.save()
                                                    }
                                                    .padding(.trailing, 20)
                                                    .padding(.leading, 20)
                                                Divider()
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color("Nice"))
                        Section("Lovely") {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(upgradesAvaliable, id: \.self) { key in
                                        if let upgrade = upgrades[key] {
                                            if Array(key)[0] == "C" {
                                                upgradeCell(upgrade: upgrade)
                                                    .onTapGesture {
                                                        if buyCheck(clicker: clicker, upgrade: upgrade, part: nil) {
                                                            if upgrade.add == true {
                                                                clicker.upgradeAdd += upgrade.value
                                                            } else {
                                                                clicker.upgradeMult += upgrade.value
                                                            }
                                                            picChange(upgrade: upgrade)
                                                            upgrades.removeValue(forKey: key)
                                                            upgradesString = upgradesAvaliable.joined(separator: ",")
                                                        } else {
                                                            
                                                        }
                                                        try? modelContext.save()
                                                    }
                                                    .padding(.trailing, 20)
                                                    .padding(.leading, 20)
                                                Divider()
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color("Lovely"))
                        Section("Premium") {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(upgradesAvaliable, id: \.self) { key in
                                        if let upgrade = upgrades[key] {
                                            if Array(key)[0] == "D" {
                                                upgradeCell(upgrade: upgrade)
                                                    .onTapGesture {
                                                        if buyCheck(clicker: clicker, upgrade: upgrade, part: nil) {
                                                            if upgrade.add == true {
                                                                clicker.upgradeAdd += upgrade.value
                                                            } else {
                                                                clicker.upgradeMult += upgrade.value
                                                            }
                                                            picChange(upgrade: upgrade)
                                                            upgrades.removeValue(forKey: key)
                                                            upgradesString = upgradesAvaliable.joined(separator: ",")
                                                        } else {
                                                            
                                                        }
                                                        try? modelContext.save()
                                                    }
                                                    .padding(.trailing, 20)
                                                    .padding(.leading, 20)
                                                Divider()
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color("Premium"))
                    }
                }
            }
        }
        .onAppear() {
            if let partsArrayString = partsString {
                partsAvaliable = partsArrayString.components(separatedBy: ",")
            } else {
                partsAvaliable = parts.keys.sorted()
            }
            
            if let upgradesArrayString = upgradesString {
                upgradesAvaliable = upgradesArrayString.components(separatedBy: ",")
            } else {
                upgradesAvaliable = upgrades.keys.sorted()
            }
        }
        .onChange(of: autoSave) {
            partsString = partsAvaliable.joined(separator: ",")
            upgradesString = upgradesAvaliable.joined(separator: ",")
            calcEquaion = "(\(C) + \(M) + \(H) + \(S) × (\(G) + \(R) + \(P))"
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
    
    func arrayFix(type: String, key: String) {
        switch type {
        case "upgrade":
            upgrades.removeValue(forKey: key)
            if let location = upgradesAvaliable.firstIndex(of: key) {
                upgradesAvaliable.remove(at: location)
                upgradesString = upgradesAvaliable.joined(separator: ",")
            }
        case "part":
            parts.removeValue(forKey: key)
            if let location = partsAvaliable.firstIndex(of: key) {
                partsAvaliable.remove(at: location)
                partsString = partsAvaliable.joined(separator: ",")
            }
        default:
            Text("Error")
        }
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
            hardDriveType = "hardDrive\(upgrade.strength)Pic"
            H = upgrade.value.formatted(.number.notation(.compactName))
        case "SSD":
            ssdType = "ssf\(upgrade.strength)Pic"
        case "PWS":
            powerSupplyType = "powerSupply\(upgrade.strength)Pic"
            P = upgrade.value.formatted(.number.notation(.compactName))
        case "MTB":
            motherBoardType = "motherBoard\(upgrade.strength)Pic"
            M = upgrade.value.formatted(.number.notation(.compactName))
        case "RUB":
            rubberDuckType = "duck\(upgrade.strength)Pic"
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

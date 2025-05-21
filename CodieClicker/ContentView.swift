//
//  ContentView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUI
import SwiftData
import CoreData
import UIKit

struct ContentView: View {
//    let myDefaults = UserDefaults(suiteName: "com.jonesclass.pawloski.codieclicker")
    
    @AppStorage("selectedtab") var selectedTab: Int = 1
    @State var clicker: Clickable
    @AppStorage("clicker.amountofdata") var clickerAmountOfData: Int?
    @AppStorage("clicker.upgradeadd") var clickerUpgradeAdd: Double?
    @AppStorage("clicker.upgrademult") var clickerUpgradeMult: Double?
    @AppStorage("autoclicker") var autoClickerON: Bool = false
    @State var autoSave = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @AppStorage("isclicked") var isClicked: Bool = false
    @State var holdOn: String = "off"
    @State var timerBool: Bool = false
    @AppStorage("cpuStrength") var cpuType: String = "blankPic"
    @AppStorage("gpuStrength") var gpuType: String = "blankPic"
    @AppStorage("ramStrength") var ramType: String = "blankPic"
    @AppStorage("motherBoardStrength") var motherboardType: String = "blankPic"
    @AppStorage("powerSupplyStrength") var powerSupplyType: String = "blankPic"
    @AppStorage("hardDriveStrength") var harDriveType: String = "blankPic"
    @AppStorage("rubberDuckSrength") var rubberDuckType: String = "blankPic"
    
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        VStack {
            HStack{
                Text(String(clicker.upgradeAdd))
                Text("\(clicker.amountOfData.formatted(.number.notation(.compactName)))dP")
                    .font(.title)
                    .onReceive(timer) { _ in
                        if autoClickerON {
                            clicker.click()
                            toggleTimer(timerBool: timerBool)
                        }
                    }
                    .onReceive(autoSave) { _ in
                        clickerAmountOfData = clicker.amountOfData
                        clickerUpgradeAdd = clicker.upgradeAdd
                        clickerUpgradeMult = clicker.upgradeMult
                    }
                Text(String(clicker.upgradeMult))
            }
            
            TabView(selection: $selectedTab) {
                Tab("", systemImage: "arrowshape.up", value: 0) {
                    UpgradeView(clicker: clicker, autoClickerON: $autoClickerON, cpuType: $cpuType, gpuType: $gpuType, ramType: $ramType, motherBoardType: $motherboardType, powerSupplyType: $powerSupplyType, hardDriveType: $harDriveType, rubberDuckType: $rubberDuckType)
                }
                Tab("", systemImage: "bolt.circle.fill",value: 1) {
                    ClickerView(clicker: clicker, isClicked: isClicked, holdOnN: $holdOn)
                }
                Tab("", systemImage: "desktopcomputer",value: 2) {
                    ComputerView(timerBool: $timerBool, cpuType: $cpuType, gpuType: $gpuType, ramType: $ramType, motherBoardType: $motherboardType, powerSupplyType: $powerSupplyType, hardDriveType: $harDriveType, rubberDuckType: $rubberDuckType)
                }
            }
        }
        .onAppear() {
            if let clickerAmountOfData: Int = clickerAmountOfData {
                clicker.amountOfData = clickerAmountOfData
            }
            if let clickerUpgradeAdd: Double = clickerUpgradeAdd {
                clicker.upgradeAdd = clickerUpgradeAdd
            }
            if let clickerUpgradeMult: Double = clickerUpgradeMult {
                clicker.upgradeMult = clickerUpgradeMult
            }
            
        }
        .background(.blue)
    }  
    
    func toggleTimer(timerBool: Bool) {
        self.timerBool = !timerBool
    }
}

#Preview {
    ContentView(clicker: Clickable())
}

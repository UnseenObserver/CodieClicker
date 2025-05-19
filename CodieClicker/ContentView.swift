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
    
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        VStack {
            HStack{
                Text(String(clicker.upgradeAdd))
                Text("\(clicker.amountOfData.formatted(.number.notation(.compactName)))dP")
                    .font(.title)
                    .onReceive(timer) { _ in
                        toggleTimer(timerBool: timerBool)
                        if autoClickerON {
                            clicker.click()
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
                    UpgradeView(clicker: clicker, autoClickerON: $autoClickerON)
                }
                Tab("", systemImage: "bolt.circle.fill",value: 1) {
                    ClickerView(clicker: clicker, isClicked: isClicked, holdOnN: $holdOn)
                }
                Tab("", systemImage: "desktopcomputer",value: 2) {
                    ComputerView(timerBool: $timerBool)
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

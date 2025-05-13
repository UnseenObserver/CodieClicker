//
//  ContentView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var selectedTab: Int = 1
    @StateObject var clicker: Clickable = Clickable()
    @State var autoClickON: Bool = false
    @State var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            HStack{
                Text(String("\(clicker.amountOfData)dP"))
                    .font(.title)
                    .onReceive(timer) { _ in
                        if autoClickON {
                            clicker.click()
                        }
                    }
            }
            
            TabView(selection: $selectedTab) {
                Tab("Upgrade", systemImage: "pencil", value: 0) {
                    UpgradeView(clicker: clicker)
                }
                Tab("", systemImage: "pencil",value: 1) {
                    ClickerView(clicker: clicker)
                    
                }
                Tab("Buy", systemImage: "pencil", value: 2) {
                    BuyView(clicker: clicker, autoClickOn: $autoClickON)
                }
            }
        }
        .background(.blue)
    }
    
    
    
}

#Preview {
    ContentView()
}

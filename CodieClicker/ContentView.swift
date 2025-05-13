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
    @State var autoClickerON: Bool = false
    @State var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            HStack{
                Text(String("\(clicker.amountOfData)dP"))
                    .font(.title)
                    .onReceive(timer) { _ in
                        if autoClickerON {
                            clicker.click()
                        }
                    }
            }
            
            TabView(selection: $selectedTab) {
                Tab("", systemImage: "arrowshape.up", value: 0) {
                    UpgradeView(clicker: clicker, autoClickerON: $autoClickerON)
                }
                Tab("", systemImage: "bolt.circle.fill",value: 1) {
                    ClickerView(clicker: clicker)
                }
            }
        }
        .background(.blue)
    }
    
    
    
}

#Preview {
    ContentView()
}

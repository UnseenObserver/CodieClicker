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
    @State var clicker: Clickable = Clickable()
    

    var body: some View {
        VStack {
            HStack{
                Text(String(clicker.amountOfData))
                    .font(.title)
                    
            }
            
            TabView(selection: $selectedTab) {
                Tab("Upgrade", systemImage: "pencil", value: 0) {
                    UpgradeView(clicker: $clicker)
                }
                Tab("", systemImage: "pencil",value: 1) {
                    ClickerView(clicker: $clicker)
                }
                Tab("Buy", systemImage: "pencil", value: 2) {
                    
                }
            }
        }
        .background(.blue)
    }

   
   
}

#Preview {
    ContentView()
}

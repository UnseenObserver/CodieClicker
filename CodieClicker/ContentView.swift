//
//  ContentView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var amountOfData: Int = 0
    @State var upgradeAdd: Int = 1
    @State var upgradeMult: Int = 1
    @State var selectedTab: Int = 1
    

    var body: some View {
        VStack {
            HStack{
                Text(String(amountOfData))
                    .font(.title)
                    
            }
            
            TabView(selection: $selectedTab) {
                Tab("Upgrade", systemImage: "pencil", value: 0) {
                    
                }
                Tab("", systemImage: "pencil",value: 1) {
                    ClickerView(amountOfData: $amountOfData, upgradeAdd: $upgradeAdd, upgradeMult: $upgradeMult)
                }
                Tab("Buy", systemImage: "pencil", value: 2) {
                    
                }
            }
        }
        .background(.blue)
    }

   
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

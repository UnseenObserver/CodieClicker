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
    
    var body: some View {
        HStack{
            VStack{
                Text("Hellow")
                Button("Upgrade") {
                    clicker.upgradeAdd += 1
                    
                }
            }
        }
    }
}

//
//  BuyView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct BuyView: View {
    @ObservedObject var clicker: Clickable
    @Binding var autoClickOn: Bool
    
    
    var body: some View {
        HStack{
            VStack{
                List {
                    Button("AutoClicker") {
                        let cost: Int = 10
                        if clicker.amountOfData >= cost {
                            clicker.amountOfData = clicker.amountOfData - cost
                            autoClickOn = true
                        }
                    }
                }
            }
        }
    }
}

struct buyable: View {
    @State var name: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image(systemName: "pencil")
                Text(name)
            }
        }
    }
}

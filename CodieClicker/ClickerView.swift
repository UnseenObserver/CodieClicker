//
//  ClickerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct ClickerView: View {
    @Binding var amountOfData: Int
    @Binding var upgradeAdd: Int
    @Binding var upgradeMult: Int
    @State var colorOfClicker: Color = .blue
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colorOfClicker)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            click()
                        }
                }
            }
        }
    }
    
    func click() {
        amountOfData = amountOfData + (upgradeAdd * upgradeMult)
    }
}

//
//  ClickerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct ClickerView: View {
    @ObservedObject var clicker: Clickable
    
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Image(systemName: "bolt.circle.fill")
                        .resizable()
                        .foregroundColor(clicker.colorOfClicker)
                        .frame(width: 300, height: 300)
                        .onTapGesture {
                            clicker.click()
                        }
                }
            }
        }
    }
}

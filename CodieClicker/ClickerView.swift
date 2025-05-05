//
//  ClickerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct ClickerView: View {
    @Binding var clicker: Clickable
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(clicker.colorOfClicker)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            
                        }
                }
            }
        }
    }
}

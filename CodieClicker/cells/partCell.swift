//
//  partCell.swift
//  CodieClicker
//
//  Created by HPro2 on 5/13/25.
//

import SwiftUICore

struct partCell: View {
    var part: Part
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                switch part.function {
                case "autoClicker":
                    Image(systemName: "cursorarrow.click.2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                default:
                    Image(systemName: "exclamationmark.warninglight.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                }
                Text(part.name)
            }
            Spacer()
            VStack {
                switch part.function {
                case "autoClicker":
                    Text("Auto Clicker")
                    Text("2 Clicks/Sec")
                default:
                    Text("Error")
                }
                
            
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(String("\(part.price)dP"))
            }
        }
        .frame(height: 100)
    }
}



//
//  partCell.swift
//  CodieClicker
//
//  Created by HPro2 on 5/13/25.
//

import SwiftUICore

struct partCell: View {
    var part: part
    
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

struct part: Hashable {
    
    var name: String
    var function: String
    var price: Int
    var id: Int
    
    init(name: String, function: String, price: Int, id: Int) {
        self.name = name
        self.function = function
        self.price = price
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}

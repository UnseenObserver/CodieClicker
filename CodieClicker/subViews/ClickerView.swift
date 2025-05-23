//
//  ClickerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI
import SwiftData

struct ClickerView: View {
    @State private var timer: Timer? = nil
    @ObservedObject private var viewModel: clickerViewModel
    @ObservedObject var clicker: Clickable
    @Environment(\.modelContext) private var modelContext
    @State var lightningBolt: Bool = false
    @Binding var holdOn: Bool
    @Binding var cpuPicture: String
    
    init(clicker: Clickable, isClicked: Bool, holdOn: Binding<Bool>, cpuPicture: Binding<String>) {
        self.clicker = clicker;
        _viewModel = ObservedObject(
            wrappedValue: clickerViewModel(
                isClicked: isClicked
            )
        )
        _holdOn = holdOn
        _cpuPicture = cpuPicture
    }
    
    
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Button {
                        viewModel.toggleClickWithAnimation()
                        clicker.click()
                        lightningBolt.toggle()
                    } label: {
                        Image(cpuPicture)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .foregroundStyle(viewModel.dataIconColor)
                            .scaleEffect(viewModel.scale)
                            .zIndex(1)
                            .lightningEffect(trigger: $lightningBolt, distance: 600, size: 60, duration: 1.5, boltCount: 9)
                    }
                    .buttonRepeatBehavior(holdOn ? .enabled:.disabled)
                }
            }
        }
    }
}

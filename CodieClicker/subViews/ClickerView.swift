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
    @Binding var holdOn: String
    @State var isHolding: Bool = false
    @State private var timer: Timer? = nil
    @ObservedObject private var viewModel: clickerViewModel
    @ObservedObject var clicker: Clickable
    @Environment(\.modelContext) private var modelContext
    
    init(clicker: Clickable, isClicked: Bool, holdOnN: Binding<String>) {
        self.clicker = clicker;
        _viewModel = ObservedObject(
            wrappedValue: clickerViewModel(
                isClicked: isClicked
            )
        )
        _holdOn = holdOnN;
    }
    
    
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Button {
                        viewModel.toggleClickWithAnimation()
                        clicker.click()
                    } label: {
                        Image(systemName: viewModel.dataIcon)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .foregroundStyle(viewModel.dataIconColor)
                            .scaleEffect(viewModel.scale)
                    }
                    .buttonRepeatBehavior(.enabled)
                    .onLongPressGesture(minimumDuration: 0.5) {
                        switch holdOn {
                        case "off":
                            Text("Off")
                        case "one":
                            startTimer(interval: 1)
                            isHolding = true
                        case "half":
                            startTimer(interval: 0.5)
                            isHolding = true
                        case "quarter":
                            startTimer(interval: 0.25)
                            isHolding = true
                        case "8th":
                            startTimer(interval: 0.125)
                            isHolding = true
                        case "16th":
                            startTimer(interval: 0.0625)
                            isHolding = true
                        default:
                            Text("Error")
                        }
                    }
                    
                }
            }
        }
    }
    
    func startTimer(interval: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            if isHolding {
                clicker.click()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
}

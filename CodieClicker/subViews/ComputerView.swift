//
//  ComputerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/19/25.
//

import SwiftUICore
import Foundation
import UIKit

struct ComputerView: View {
    @Binding var timerBool: Bool
    @State var height: CGFloat = 80
    @State var width: CGFloat = 80
    @ObservedObject private var cpuViewModel: upgradeViewModel
    @ObservedObject private var gpuViewModel: upgradeViewModel
    @ObservedObject private var ramViewModel: upgradeViewModel
    @ObservedObject private var motherBoardViewModel: upgradeViewModel
    @ObservedObject private var hardDriveViewModel: upgradeViewModel
    @ObservedObject private var powerSupplyViewModel: upgradeViewModel
    @ObservedObject private var rubberDuckViewModel: upgradeViewModel
    
    init(timerBool: Binding<Bool>) {
        _timerBool = timerBool
        _cpuViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
        _gpuViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
        _ramViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
        _motherBoardViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
        _hardDriveViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
        _powerSupplyViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
        _rubberDuckViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: Image(systemName: "pencil")
            )
        )
    }
    
    
    var body: some View {
        HStack {
            VStack{
                Spacer(minLength: 40)
                HStack {
                    Spacer(minLength: 15)
                    Image(gpuViewModel.upgradeIcon)
                        .resizable()
                        .background(.blue)
                        .frame(width: width, height: height)
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .background(.blue)
                        .frame(width: width, height: height)
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .background(.blue)
                        .frame(width: width, height: height)
                    Spacer(minLength: 15)
                }
                Spacer(minLength: 30)
                HStack {
                    if timerBool {
                        Image(systemName: "pencil")
                            .resizable()
                            .background(.blue)
                            .frame(width: width*1.5, height: height*1.5)
                    } else {
                        Text("Hello")
                    }
                }
                Spacer(minLength: 30)
                HStack {
                    Spacer(minLength: 15)
                    Image(systemName: "pencil")
                        .resizable()
                        .background(.blue)
                        .frame(width: width, height: height)
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .background(.blue)
                        .frame(width: width, height: height)
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .background(.blue)
                        .frame(width: width, height: height)
                    Spacer(minLength: 15)
                }
                Spacer(minLength: 40)
            }
        }
    }
}

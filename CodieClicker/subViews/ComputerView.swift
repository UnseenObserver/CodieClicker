//
//  ComputerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/19/25.
//

import SwiftUICore
import Foundation
import UIKit
import SwiftUI

struct ComputerView: View {
    @Binding var timerBool: Bool
    @State var height: CGFloat = 80
    @State var width: CGFloat = 80
    @State var lightningBolt: Bool = false
    @State var counter: Int = 0
    @ObservedObject private var cpuViewModel: upgradeViewModel
    @ObservedObject private var gpuViewModel: upgradeViewModel
    @ObservedObject private var ramViewModel: upgradeViewModel
    @ObservedObject private var motherBoardViewModel: upgradeViewModel
    @ObservedObject private var hardDriveViewModel: upgradeViewModel
    @ObservedObject private var powerSupplyViewModel: upgradeViewModel
    @ObservedObject private var rubberDuckViewModel: upgradeViewModel
    @Binding var cpuType: String
    @Binding var gpuType: String
    @Binding var ramType: String
    @Binding var motherboardType: String
    @Binding var powerSupplyType: String
    @Binding var harDriveType: String
    @Binding var rubberDuckType: String
    
    init(timerBool: Binding<Bool>, cpuType: Binding<String>, gpuType: Binding<String>, ramType: Binding<String>, motherBoardType: Binding<String>, powerSupplyType: Binding<String>, hardDriveType: Binding<String>, rubberDuckType: Binding<String>) {
        _cpuType = cpuType
        _gpuType = gpuType
        _ramType = ramType
        _motherboardType = motherBoardType
        _powerSupplyType = powerSupplyType
        _harDriveType = hardDriveType
        _rubberDuckType = rubberDuckType
        _timerBool = timerBool
        _cpuViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: cpuType
            )
        )
        _gpuViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: gpuType
            )
        )
        _ramViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: ramType
            )
        )
        _motherBoardViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: motherBoardType
            )
        )
        _hardDriveViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: hardDriveType
            )
        )
        _powerSupplyViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: powerSupplyType
            )
        )
        _rubberDuckViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: rubberDuckType
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
                        .frame(width: width, height: height)
                        .scaleEffect(gpuViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 80, size: 5, duration: 1.1, boltCount: 5)
                    Spacer()
                    Image(ramViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(ramViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 80, size: 5, duration: 1.2, boltCount: 3)

                    Spacer()
                    Image(rubberDuckViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(rubberDuckViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 80, size: 5, duration: 0.9, boltCount: 3)
                    Spacer(minLength: 15)
                }
                Spacer(minLength: 20)
                HStack {
                    Image(cpuViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width*1.8, height: height*1.8)
                        .scaleEffect(cpuViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 160, size: 8, duration: 1, boltCount: 7)
                }
                Spacer(minLength: 20)
                HStack {
                    Spacer(minLength: 15)
                    Image(powerSupplyViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(powerSupplyViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 80, size: 5, duration: 0.8, boltCount: 3)
                    Spacer()
                    Image(motherBoardViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(motherBoardViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 80, size: 5, duration: 1.3, boltCount: 5)
                    Spacer()
                    Image(hardDriveViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(hardDriveViewModel.scale)
                        .zIndex(1)
                        .lightningEffect(trigger: $lightningBolt, distance: 80, size: 5, duration: 1.1, boltCount: 3)
                    Spacer(minLength: 15)
                }
                Spacer(minLength: 40)
            }
            .onChange(of: timerBool) {
                cpuViewModel.toggleSizeWithAnimation()
                gpuViewModel.toggleSizeWithAnimation()
                ramViewModel.toggleSizeWithAnimation()
                motherBoardViewModel.toggleSizeWithAnimation()
                powerSupplyViewModel.toggleSizeWithAnimation()
                hardDriveViewModel.toggleSizeWithAnimation()
                rubberDuckViewModel.toggleSizeWithAnimation()
                counter += 1
                if counter == 3 {
                    lightningBolt = true
                    counter = 0
                }
            }
        }
    }
}

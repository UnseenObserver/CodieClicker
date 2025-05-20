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
                upgradeIcon: "DogPic"
            )
        )
        _gpuViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: "DogPic"
            )
        )
        _ramViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: "DogPic"
            )
        )
        _motherBoardViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: "DogPic"
            )
        )
        _hardDriveViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: "DogPic"
            )
        )
        _powerSupplyViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: "DogPic"
            )
        )
        _rubberDuckViewModel = ObservedObject(
            wrappedValue: upgradeViewModel(
                isTicked: timerBool,
                upgradeIcon: "DogPic"
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
                    Spacer()
                    Image(ramViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(ramViewModel.scale)
                    Spacer()
                    Image(rubberDuckViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(rubberDuckViewModel.scale)
                    Spacer(minLength: 15)
                }
                Spacer(minLength: 20)
                HStack {
                    Image(cpuViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width*1.8, height: height*1.8)
                        .scaleEffect(cpuViewModel.scale)
                }
                Spacer(minLength: 20)
                HStack {
                    Spacer(minLength: 15)
                    Image(powerSupplyViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(powerSupplyViewModel.scale)
                    Spacer()
                    Image(motherBoardViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(motherBoardViewModel.scale)
                    Spacer()
                    Image(hardDriveViewModel.upgradeIcon)
                        .resizable()
                        .frame(width: width, height: height)
                        .scaleEffect(hardDriveViewModel.scale)
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
            }
        }
    }
}

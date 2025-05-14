//
//  ClickerView.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUICore
import SwiftUI

struct ClickerView: View {
    @ObservedObject private var viewModel: clickerViewModel
    @ObservedObject var clicker: Clickable
    
    init(clicker: Clickable, isClicked: Bool,
         toggleClick: @escaping () -> Void) {
        self.clicker = clicker;
        _viewModel = ObservedObject(
            wrappedValue: clickerViewModel(
                isClicked: isClicked
            )
        )
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
                }
            }
        }
    }
    
    
}

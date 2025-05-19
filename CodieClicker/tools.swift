//
//  tools.swift
//  CodieClicker
//
//  Created by HPro2 on 5/13/25.
//

import SwiftUICore
import SwiftUI

struct Tools {
 
    
}

class clickerViewModel: ObservableObject {
    @Published var scale = 1.0
    
    var isClicked: Bool
    
    var dataIcon: String {
        isClicked ? "bolt.circle.fill" : "bolt.circle"
    }
    
    var dataIconColor: Color {
        isClicked ? .yellow : .blue
    }
    
    func toggleClickWithAnimation() {
        withAnimation(.linear(duration: 0.05)) {
            scale = 1.2
            isClicked = true
        }
        withAnimation(.linear(duration: 0.05).delay(0.1)) {
            scale = 1.0
            isClicked = false
        }
    }
    
    init(isClicked: Bool) {
        self.isClicked = isClicked
    }
}

class upgradeViewModel: ObservableObject {
    @Published var scale = 1.0
    @Binding var isTicked: Bool
    var upgradeIcon: Image
        
    func toggleClickWithAnimation() {
        withAnimation(.linear(duration: 0.05)) {
            scale = 1.2
            isTicked = true
        }
        withAnimation(.linear(duration: 0.05).delay(0.1)) {
            scale = 1.0
            isTicked = false
        }
    }
    
    init(isTicked: Binding<Bool>, upgradeIcon: Image) {
        _isTicked = isTicked
        self.upgradeIcon = upgradeIcon
    }
}

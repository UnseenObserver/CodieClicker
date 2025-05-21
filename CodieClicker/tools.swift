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
    @Binding var upgradeIcon: String
        
    func toggleSizeWithAnimation() {
        withAnimation(.linear(duration: 0.05)) {
            scale = 1.2
            isTicked = true
        }
        withAnimation(.linear(duration: 0.05).delay(0.1)) {
            scale = 1.0
            isTicked = false
        }
    }
    
    init(scale: Double = 1.0, isTicked: Binding<Bool>, upgradeIcon: Binding<String>) {
        self.scale = scale
        _isTicked = isTicked
        _upgradeIcon = upgradeIcon
    }
}

struct LightningBolt: Shape {
    var size:CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + size, y: rect.midY - size*1.5))
        path.addLine(to: CGPoint(x: rect.midX - size, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + size, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - size, y: rect.midY + size*1.5))
        path.addLine(to: CGPoint(x: rect.midX + size, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

struct LightningBoltView: View {
    var angle: Angle
    var distance: CGFloat
    var animationDelay: Double
    var size: CGFloat
    var duration: Double

    @State private var animate = false

    var body: some View {
        LightningBolt(size: size)
            .fill(Color.yellow)
            .frame(width: 10, height: 20)
            .opacity(animate ? 0 : 1)
            .offset(x: animate ? cos(angle.radians) * distance : 0,
                    y: animate ? sin(angle.radians) * distance : 0)
            .rotationEffect(angle)
            .onAppear {
                withAnimation(Animation.easeOut(duration: duration).delay(animationDelay)) {
                    animate = true
                }
            }
    }
}

struct LightningExplosion: View {
    let boltCount: Int
    var distance: CGFloat
    var size: CGFloat
    var duration: Double

    var body: some View {
        ZStack {
            ForEach(0 ..< boltCount, id: \.self) { i in
                LightningBoltView(
                    angle: Angle.degrees(Double(i) / Double(boltCount) * 360),
                    distance: distance,
                    animationDelay: Double(i) * 0.05,
                    size: size,
                    duration: duration
                )
            }
        }
    }
}

struct LightningEffectModifier: ViewModifier {
    @Binding var trigger: Bool
    var distance: CGFloat
    var size: CGFloat
    var duration: Double
    var boltCount: Int
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if trigger {
                LightningExplosion(boltCount: boltCount, distance: distance, size: size, duration: duration)
                    .transition(.opacity)
            }
        }
        .onChange(of: trigger) { oldVaule, newValue in
            if newValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    trigger = false
                }
            }
        }
    }
}

extension View {
    func lightningEffect(trigger: Binding<Bool>, distance: CGFloat, size: CGFloat, duration: Double, boltCount: Int) -> some View {
        self.modifier(LightningEffectModifier(trigger: trigger, distance: distance, size: size, duration: duration, boltCount: boltCount))
        }
}

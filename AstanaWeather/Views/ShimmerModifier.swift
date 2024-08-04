//
//  ShimmerModifier.swift
//  AstanaWeather
//
//  Created by Shakir Kadirov on 04.08.2024.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var offset: CGFloat = -0.3

    func body(content: Content) -> some View {
        content
            .mask(
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.5), Color.white, Color.white.opacity(0.5)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .rotationEffect(.degrees(70))
                .offset(x: offset)
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    offset = UIScreen.main.bounds.width
                }
            }
    }
}

extension View {
    func shimmering() -> some View {
        self.modifier(ShimmerModifier())
    }
}


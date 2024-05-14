//
//  ContentView.swift
//  FlipCardAnimation
//
//  Created by Goateraction on 5/14/24.
//  Copyright © 2024 Goateraction. All rights reserved.
//
//  Github, Instagram, X
//  -> @Goateraction
//

import SwiftUI

struct ButtonStyle_scale: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .shadow(color: .gray.opacity(configuration.isPressed ? 0 : 0.4), radius: 10, x: 0, y: 3)
            .animation(.smooth(duration:0.3), value: configuration.isPressed)
            .sensoryFeedback(configuration.isPressed ? .selection : .start, trigger: configuration.isPressed)
            .animation(nil, value: configuration.isPressed)
    }
}

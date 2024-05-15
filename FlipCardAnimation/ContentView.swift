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

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            Burger()
//            Earth()
                .navigationTitle("Flip Card Animation")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Text("@Goateraction").bold()
                    }
                }
        }
    }
    
}

#Preview {
    ContentView()
}

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

struct Earth: View {
    @State var flip : Bool = false
    
    var body: some View {
        Button {
            withAnimation(.bouncy) {
                flip.toggle()
            }
        } label: {
            ZStack {
                if flip {
                    backView()
                        .transition(.reverseFlip)
                } else {
                    frontView()
                        .transition(.flip)
                }
            }
        }.buttonStyle(ButtonStyle_scale())
    }
    
    @ViewBuilder
    func frontView() -> some View {
        Image(.earth)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 400)
            .overlay(alignment: .topLeading, content: {
                VStack(alignment:.leading) {
                    Text("Planet")
                        .font(.largeTitle).fontWeight(.heavy)
                    Text("Earth")
                        .font(.largeTitle)
                }
                .foregroundStyle(.white)
                .padding(24)
            })
            .overlay(alignment: .bottomTrailing, content: {
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .foregroundStyle(.white)
                    .padding(24)
            })
            .mask {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 300, height: 400)
            }
    }
    
    @ViewBuilder
    func backView() -> some View {
        VStack(alignment:.leading, spacing:8){
            Text("Planet Earth").font(.title).bold()
            Text("Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth's water is contained in its global ocean, covering 70.8% of Earth's crust. The remaining 29.2% of Earth's crust is land, most of which is located in the form of continental landmasses within Earth's land hemisphere. Most of Earth's land is somewhat humid and covered by vegetation, while large sheets of ice at Earth's polar deserts retain more water than Earth's groundwater, lakes, rivers and atmospheric water combined. Earth's crust consists of slowly moving tectonic plates, which interact to produce mountain ranges, volcanoes, and earthquakes. Earth has a liquid outer core that generates a magnetosphere capable of deflecting most of the destructive solar winds and cosmic radiation.")
        }
        .padding()
//        PlayerView(filename: "backMV")
            .frame(width: 300, height: 400)
            .background(RoundedRectangle(cornerRadius: 25).fill(.blue.gradient))
//            .mask {
//                RoundedRectangle(cornerRadius: 25)
//                    .frame(width: 300, height: 400)
//            }
//            .overlay(alignment: .topLeading, content: {
//                Text("Burger Recipe")
//                    .font(.headline)
//                    .fontWeight(.heavy)
//                    .foregroundStyle(.white)
//                    .padding()
//            })
//            .overlay(alignment: .bottom, content: {
//                Button {
//                    
//                } label: {
//                    Label("Cart", systemImage: "cart.fill")
//                        .frame(maxWidth: .infinity)
//                        .foregroundStyle(.black)
//                        .background(
//                            RoundedRectangle(cornerRadius: 16)
//                                .fill(.regularMaterial)
//                                .frame(height: 42)
//                        )
//                }
//                .buttonStyle(.plain)
//                    .padding(.horizontal, 16)
//                    .padding(.bottom, 24)
//            })
    }
    
    
    
}

#Preview {
    Earth()
}

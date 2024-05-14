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
    @State var flip : Bool = false
    
    var body: some View {
        NavigationStack{
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
            .navigationTitle("Flip Card Animation")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Text("@Goateraction").bold()
                }
            }
        }
    }
    
    @ViewBuilder
    func frontView() -> some View {
        Image(.frontImg)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 400)
            .overlay(alignment: .topLeading, content: {
                VStack(alignment:.leading) {
                    Text("Goateraction")
                        .font(.largeTitle).fontWeight(.heavy)
                    Text("Burger")
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
        PlayerView(filename: "backMV")
            .frame(width: 300, height: 400)
            .mask {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 300, height: 400)
            }
            .overlay(alignment: .topLeading, content: {
                Text("Burger Recipe")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .padding()
            })
            .overlay(alignment: .bottom, content: {
                Button {
                    
                } label: {
                    Label("Cart", systemImage: "cart.fill")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.regularMaterial)
                                .frame(height: 42)
                        )
                }
                .buttonStyle(.plain)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
            })
    }
    
    
    
}

#Preview {
    ContentView()
}

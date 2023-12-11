//
//  ContentView.swift
//  GTAVILogoDrawing
//
//  Created by Anup D'Souza
//

import SwiftUI

struct ContentView: View {
    // MARK: Gradients
    private let purpleGradient = Gradient(stops: [
        .init(color: .colorDarkPurple, location: 0),
        .init(color: .colorPurple, location: 6)
    ])
    
    private let yellowPinkGradient = Gradient(stops: [
        .init(color: .colorYellow, location: 0),
        .init(color: .colorLightPink, location: 0.2),
        .init(color: .colorPink, location: 0.4),
        .init(color: .colorPurple, location: 0.8)
    ])
    
    private let blueYellowGradient = Gradient(stops: [
        .init(color: .colorBlue, location: 0),
        .init(color: .colorLightPink, location: 0.4),
        .init(color: .colorDarkYellow, location: 0.75)
    ])
    
    private var palmTreeImage: some View {
        Image("palmtree")
            .resizable()
            .colorMultiply(.black)
            .opacity(0.2)
    }
    
    private let logoTextGradient = LinearGradient(colors: [
        .colorYellow,
        .colorPink,
        .colorPurple
    ], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            Color.black
            HStack(spacing:0) {
                // MARK: V shapes
                ZStack {
                    GTAShapeV()
                        .fill(LinearGradient(gradient: purpleGradient, startPoint: .top, endPoint: .bottom))
                    GTAShapeV()
                        .inset(by: 8)
                        .fill(LinearGradient(gradient: yellowPinkGradient, startPoint: .top, endPoint: .bottom))
                    GTAShapeV()
                        .inset(by: 16)
                        .fill(LinearGradient(gradient: blueYellowGradient, startPoint: .top, endPoint: .bottom))
                        .overlay {
                            palmTreeImage
                                .scaleEffect(CGSize(width: -1.0, height: 1.0))
                                .rotationEffect(.degrees(15))
                                .offset(x: -10)
                                .clipShape(GTAShapeV().inset(by: 16))
                        }
                }
                .frame(width: 216, height: 223)
                
                // MARK: I shapes
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: purpleGradient, startPoint: .top, endPoint: .bottom))
                    Rectangle()
                        .fill(LinearGradient(gradient: yellowPinkGradient, startPoint: .top, endPoint: .bottom))
                        .padding(5)
                    Rectangle()
                        .fill(LinearGradient(gradient: blueYellowGradient, startPoint: .top, endPoint: .bottom))
                        .overlay {
                            palmTreeImage
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300)
                                .rotationEffect(.degrees(-15))
                                .offset(x: 20, y: 10)
                        }
                        .clipped()
                        .padding(10)
                    
                }
                .frame(width: 83, height: 223)
                .offset(x: -5)
            }
            
            // MARK: Text logo with gradient
            Image("gtatext")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 230)
                .strokeWithGradient(gradient: AnyShapeStyle(logoTextGradient))
                .offset(x: 15, y: -15)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

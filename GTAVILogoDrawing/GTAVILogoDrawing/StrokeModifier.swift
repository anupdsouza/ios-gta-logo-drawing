//
//  StrokeModifier.swift
//  GTAVILogoDrawing
//
//  Created by Anup D'Souza
//

import SwiftUI

// modified from https://stackoverflow.com/a/76054700

extension View {
    func strokeWithGradient(gradient: AnyShapeStyle) -> some View {
        modifier(StrokeModifer(gradient: gradient))
    }
}

struct StrokeModifer: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var gradient: AnyShapeStyle = AnyShapeStyle(Gradient(colors: [.white]))
    
    func body(content: Content) -> some View {
        if strokeSize > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }
    
    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(
                Rectangle()
                    .fill(gradient)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }
    
    func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { ctx in
                if let resolvedView = context.resolveSymbol(id: id) {
                    ctx.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}

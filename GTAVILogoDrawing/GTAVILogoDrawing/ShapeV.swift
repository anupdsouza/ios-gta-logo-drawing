//
//  ShapeV.swift
//  GTAVILogoDrawing
//
//  Created by Anup D'Souza
//

import SwiftUI

struct GTAShapeV: InsettableShape {
    
    var insetAmount: CGFloat = 0

    func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let yTop = insetAmount == 0 ? 0 : yTop(w: rect.width, h: rect.height)
        var x: CGFloat = insetAmount
        var y: CGFloat = yTop
        path.move(to: CGPoint(x: x, y: y))
        x = (rect.width - insetAmount) * 0.38
        path.addLine(to: CGPoint(x: x, y: y))
        x = rect.width / 2
        y += innerHeight(w: rect.width, h: (rect.height - insetAmount) * 0.21) + insetAmount
        path.addLine(to: CGPoint(x: x, y: y))
        x = (rect.width - insetAmount) * 0.62 + insetAmount
        y = yTop
        path.addLine(to: CGPoint(x: x, y: y))
        x = rect.width - insetAmount
        path.addLine(to: CGPoint(x: x, y: y))
        x = rect.width / 2
        y += innerHeight(w: rect.width, h: rect.height)
        path.addLine(to: CGPoint(x: x, y: y))
        path.closeSubpath()
        return path
    }
    
    private func innerHeight(w: CGFloat, h: CGFloat) -> CGFloat {
        let ratio = h / w
        return ratio * (w - insetAmount - insetAmount)
    }
    
    private func yTop(w: CGFloat, h: CGFloat) -> CGFloat {
        let deltaH = h - innerHeight(w: w, h: h)
        let angle = atan2(2 * h, w)
        let sideSpace = insetAmount * sin(angle)
        return (deltaH * sideSpace) / (deltaH + sideSpace)
    }
}


struct ShapeV: View {
    var body: some View {
        ZStack {
            GTAShapeV()
                .stroke(lineWidth: 2)
        }
    }
}

#Preview {
    ShapeV()
}

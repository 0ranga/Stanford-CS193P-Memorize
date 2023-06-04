//
//  Diamond.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/21/23.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
//        let diagonal = min(rect.width, rect.height)/2
        
        let height = rect.height/2
        let width = rect.width/2
        
        p.move(to: CGPoint(x: center.x, y: center.y + height))
        p.addLine(to: CGPoint(x: center.x + width, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y - height))
        p.addLine(to: CGPoint(x: center.x - width, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y + height))
        
        return p
    }
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond().stroke()
    }
}

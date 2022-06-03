//
//  HypocycloidView.swift
//  Lesson 6
//
//  Created by Alexey Efimov on 24.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI


struct HypocycloidView: View {
    @State private var outerRadius = 4.176737
    @State private var innerRadius = 1.76
    
    let width: CGFloat
    let height: CGFloat
    var showSliders = false
        
    var body: some View {
        VStack {
            Spacer()
            Path { path in
                let size = min(width, height)
                let ratio = Double(size) / ((outerRadius - innerRadius) + innerRadius) / 2.0
                
                var angle = 0
                let maxT = 2880
                var curveClosed = false
                
                var x0 = 0.0
                var y0 = 0.0
                
                while(angle < maxT && !curveClosed) {
                    let theta = Angle(degrees: Double(angle)).radians
                    let component = ((outerRadius + innerRadius) / innerRadius) * theta
                    let x = (outerRadius - innerRadius) * cos(theta) + innerRadius * cos(component)
                    let y = (outerRadius - innerRadius) * sin(theta) - innerRadius * sin(component)
                    
                    let xc = x * ratio
                    let yc = y * ratio
                    if angle == 0 {
                        x0 = xc
                        y0 = yc
                        path.move(to: CGPoint(x: x0, y: y0))
                    } else {
                        path.addLine(to: CGPoint(x: xc, y: yc))
                        if abs(xc - x0) < 0.25 && abs(yc - y0) < 0.25 {
                            curveClosed = true
                        }
                    }
                    angle += 1
                }
            }
            .offset(x: width / 2.0, y: height / 2.0)
            .stroke(Color.red, lineWidth: 2)
            .frame(width: width, height: height)
            
            Spacer()
            
            if showSliders {
                Slider(value: $outerRadius, in: 1...10)
                Slider(value: $innerRadius, in: 1...10)
            }
        }
        .padding()
    }
}

struct HypocycloidView_Previews: PreviewProvider {
    static var previews: some View {
        HypocycloidView(width: 250, height: 250, showSliders: true)
    }
}

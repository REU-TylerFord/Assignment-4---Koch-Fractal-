//
//  CesaroView.swift
//  CesaroView
//
//  Created by Jeff_Terry on 1/17/22.
//

import Foundation
import SwiftUI

struct CesaroView: View {
    
    @Binding var iterationsFromParent: Int?
    /// Class Parameters Necessary for Drawing
    var framewidth: CGFloat = 0.0
    var frameheight: CGFloat = 0.0
    var iterations: Int = 0
    var shouldIClear = true
    var shouldIDrawCircle = false
    var shouldIDrawPoints = false
    var shouldIDrawline = false
    var colorToDraw = "Blue"
    var allThePoints: [(xPoint: Double, yPoint: Double, radiusPoint: Double, color: String)] = []  ///Array of tuples
    var x: CGFloat = 75
    var y: CGFloat = 100
    let pi = CGFloat(Float.pi)
    var piDivisorForAngle = 0.0
    
    var angle: CGFloat = 0.0

    
    //iterations = checkNumberOfIterations(number: iterationsFromParent!)
    
    var body: some View {
        
        CesaroFractalShape(iterations: iterationsFromParent!)
        //.fill(Color.red)
            .stroke(Color.red, lineWidth: 1)
        .frame(width: 600, height: 600)
        .background(Color.white)
        .padding()
        
        
    }
}

struct CesaroFractalShape: Shape {
    
    let iterations: Int
    let smoothness : CGFloat = 1.0
    
    
    func path(in rect: CGRect) -> Path {
        
        var CesaroPoints: [(xPoint: Double, yPoint: Double)] = []  ///Array of tuples
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        let size: Double = 400
        
        // draw from the center of our rectangle
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        // Offset from center in y-direction for Koch Snowflake
        let yoffset = size/(2.0*tan(60.0/180.0*Double.pi))
        
        x = center.x - CGFloat(size/2.0)
        y = rect.height/2.0 - CGFloat(yoffset)
        
        guard iterations > 0 else { return Path() }
        
        guard iterations < 9 else { return Path() }
        
        CesaroPoints = CesaroFractalCalculator(fractalnum: iterations-1, x: x, y: y, size: size)

        // Create the Path for the Koch Snowflake
        
        var path = Path()

        // move to the initial position
        path.move(to: CGPoint(x: CesaroPoints[0].xPoint, y: CesaroPoints[0].yPoint))

        // loop over all our points to draw create the paths
        for item in 1..<CesaroPoints.endIndex  {
        
            path.addLine(to: CGPoint(x: CesaroPoints[item].xPoint, y: CesaroPoints[item].yPoint))
            
            
            }


        return (path)
    }
}


func checkNumberOfIterations(number: Int) -> Int {
    
    if (number <= 8 && number >= 0) {
        
        return number
    }
    
        
        return Int(8)
    
}






//struct CesaroView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        CesaroView(iterationsFromParent: iterationsFromParent)
//    }
//}

//
//  Cesaro_Functions.swift
//  Cesaro_Functions
//
//  Created by Jeff_Terry on 1/17/22.
//

import Foundation
import SwiftUI


// Drawing the flake

/*** Distance needs to be a Double ***/
func makeline(distance: Double, angle: CGFloat, x: CGFloat, y: CGFloat) -> [(xPoint: Double, yPoint: Double)] {
    
    let pi = CGFloat(Float.pi)
    var newx: CGFloat
    var newy: CGFloat
    
    newx = x + CGFloat(distance) * cos(angle * pi / 180.0)
    newy = y + CGFloat(distance) * sin(angle * pi / 180.0)
    
    return([(xPoint: Double(newx), yPoint: Double(newy))])
    
}

func turn (angle: CGFloat, angleChange: Double) -> CGFloat
{
    let newangle = angle + CGFloat(angleChange)
    
    return(newangle)
}

func CesaroFractalCalculator(fractalnum: Int, x: CGFloat, y: CGFloat, size: Double) -> [(xPoint: Double, yPoint: Double)]
{
    var allThePoints: [(xPoint: Double, yPoint: Double)] = []  ///Array of tuples
    var myX = x
    var myY = y
    
    var currentPoint: [(xPoint: Double, yPoint: Double)] = []  ///Array of tuples
    var angle: CGFloat = 0.0

    allThePoints.append((xPoint: Double(x), yPoint: Double(y)))
    
    angle = turn(angle: angle, angleChange: 60)
    currentPoint += CesaroSide(fractalnum: fractalnum, x: myX, y: myY, angle: angle, size: size)
    myX = CGFloat(currentPoint[currentPoint.endIndex-1].xPoint)
    myY = CGFloat(currentPoint[currentPoint.endIndex-1].yPoint)
    allThePoints+=currentPoint
    
    currentPoint.removeAll()
    
    angle = turn(angle: angle, angleChange: -120)
    currentPoint += CesaroSide(fractalnum: fractalnum, x: myX, y: myY, angle: angle, size: size)
    myX = CGFloat(currentPoint[currentPoint.endIndex-1].xPoint)
    myY = CGFloat(currentPoint[currentPoint.endIndex-1].yPoint)
    allThePoints+=currentPoint
    
    currentPoint.removeAll()
    
    angle = turn(angle: angle, angleChange: -120)
    currentPoint += CesaroSide(fractalnum: fractalnum, x: myX, y: myY, angle: angle, size: size)
    myX = CGFloat(currentPoint[currentPoint.endIndex-1].xPoint)
    myY = CGFloat(currentPoint[currentPoint.endIndex-1].yPoint)
    allThePoints+=currentPoint
    
    return(allThePoints)
    
}


func CesaroSide(fractalnum: Int, x: CGFloat, y: CGFloat, angle: CGFloat, size: Double) -> [(xPoint: Double, yPoint: Double)] {
    
    var myAngle = angle
    var myX = x
    var myY = y
    var piDivisorForAngle = 3.0
    var currentPoint: [(xPoint: Double, yPoint: Double)] = []  ///Array of tuples
    
    
    if(fractalnum == 0){
        currentPoint += makeline(distance: size, angle: myAngle, x: myX, y: myY)
        return(currentPoint)
    }
    else{
        
        let theta = Double.pi/piDivisorForAngle
        let thetaDeg = theta*180.0/Double.pi
        
        let newSizeOfSide = size/(2.0*(1.0+sin(((theta))/2.0)))
        
        currentPoint += CesaroSide(fractalnum: fractalnum-1, x: myX, y: myY, angle: myAngle, size: newSizeOfSide)
        myX = CGFloat(currentPoint[currentPoint.endIndex-1].xPoint)
        myY = CGFloat(currentPoint[currentPoint.endIndex-1].yPoint)
        
        myAngle = turn(angle: myAngle, angleChange: -(90.0-thetaDeg/2.0))
        
        currentPoint += CesaroSide(fractalnum: fractalnum-1, x: myX, y: myY, angle: myAngle, size: newSizeOfSide)
        myX = CGFloat(currentPoint[currentPoint.endIndex-1].xPoint)
        myY = CGFloat(currentPoint[currentPoint.endIndex-1].yPoint)
        
        myAngle = turn(angle: myAngle, angleChange: (180.0-thetaDeg))
        
        currentPoint += CesaroSide(fractalnum: fractalnum-1, x: myX, y: myY, angle: myAngle, size: newSizeOfSide)
        myX = CGFloat(currentPoint[currentPoint.endIndex-1].xPoint)
        myY = CGFloat(currentPoint[currentPoint.endIndex-1].yPoint)
        
        myAngle = turn(angle: myAngle, angleChange: -(90.0-thetaDeg/2.0))
        
        currentPoint += CesaroSide(fractalnum: fractalnum-1, x: myX, y: myY, angle: myAngle, size: newSizeOfSide)
        
        
    }
    return(currentPoint)
}

//
//  ContentView.swift
//  Shared
//
//  Created by Jeff_Terry on 1/17/22.
//
// Repurposed by Tyler Ford for this Assignment - Kochs Snowflake Fractal
// Edited on February 17th 

import SwiftUI

struct ContentView: View {
    @State var guess = ""
    @State private var totalIterations: Int? = 0
    @State private var KochSnowFlakeAngle: Int? = 8
    @State var editedKochSnowFlakeAngle: Int? = 8
    @State var editedTotalIterations: Int? = 0
    @State var viewArray :[AnyView] = []
    
        
    private var intFormatter: NumberFormatter = {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            return f
        }()
        
        var body: some View {
        
           VStack {
               VStack{
            
            ZStack {
                
               KochSnowFlakeView(iterationsFromParent: $totalIterations, angleFromParent: $KochSnowFlakeAngle).drawingGroup()
                    
                // Stop the window shrinking to zero.
                Spacer()
            }.frame(minHeight: 600, maxHeight: 600)
                       .frame(minWidth: 600, maxWidth: 600)
               }
            
            VStack{
                HStack{
                    
                    Text(verbatim: "Iterations:")
                    .padding()
                    TextField("Number of Iterations (must be between 0 and 7 inclusive)", value: $editedTotalIterations, formatter: intFormatter, onCommit: {
                        self.totalIterations = self.editedTotalIterations
                    })
                
                        .padding()
                    
                    }
                
                
                        .padding()
                    
                    }
               }
           }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

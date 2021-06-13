//
//  ContentView.swift
//  ValueFromSlider
//
//  Created by Philip Noskov on 13.06.2021.
//

import SwiftUI

struct ContentView: View {
  
    @State private var target = Int.random(in: 0...100)
    @State private var currentValue: Double = 50
    @State private var showAlert = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Подвиньте слайдер как можно ближе к: ")
                Text("\(target)")
            }
            
            SliderSettingsView(currentValue: $currentValue,
                               alpha: computeAlpha()
            )
           
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Yuor Score:"),
                      message: Text("\(computeScore())")
                )
            }
            .offset(x: 0, y: 20)
           
            Button("Начать заново") {
                target = Int.random(in: 0...100)
            }
            .offset(x: 0, y: 40)
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(target - lround(currentValue))
        return 100 - difference
    }
    
    private func computeAlpha() -> Double {
        let score = Double(computeScore())
        let alpha = score / 100
        return alpha
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

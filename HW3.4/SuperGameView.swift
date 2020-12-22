//
//  ContentView.swift
//  HW3.4
//
//  Created by Сергей on 21.12.2020.
//

import SwiftUI

struct SuperGameView: View {
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack{

            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("\(0)")
                CustomUISlider(value: $currentValue,
                               color: color)
                Text("\(100)")
            }.padding()
            
            Button(action: { showAlert = true }) {
                Text("Проверь меня!")
            }
            .alert(isPresented: $showAlert) {
                UINotificationFeedbackGenerator().notificationOccurred(.success)
                return Alert(title: Text("Your score"), message: Text("\(computeScore())"))
            }.padding()
            
            Button(action: { targetValue = Int.random(in: 0...100) }) {
                Text("Начать заново")
            }.padding()
        }
    }
}

extension SuperGameView {
    private var color: UIColor {
        let alpha = CGFloat(1 - abs(Double(targetValue) - currentValue) / 100)
        return UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuperGameView()
        
    }
}

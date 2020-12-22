//
//  ContentView.swift
//  HW3.4
//
//  Created by Сергей on 21.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 1.0
    private let targetValue = Int.random(in: 0...100)
    
    private var color: UIColor {
        let alpha = CGFloat(1 - abs(Double(targetValue) - currentValue) / 100)
//        print(alpha)
       return UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
        
    
    }
    
    var body: some View {
        VStack{
            
            Circle()
                .foregroundColor(Color(color))
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            
            HStack {
                Text("0")
                CustomUISlider(value: $currentValue, color: color)
                Text("100")
            }
        }
        .padding()
        
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}



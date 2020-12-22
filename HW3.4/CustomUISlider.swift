//
//  CustomUISlider.swift
//  HW3.4
//
//  Created by Сергей on 21.12.2020.
//

import SwiftUI

struct CustomUISlider: UIViewRepresentable {
    @Binding var value: Double
//    let opacityThumbTint: Double
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = color

        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
//        uiView.thumbTintColor = UIColor(red: 1,
//                                        green: 0,
//                                        blue: 0,
//                                        alpha: opacityThumbTint
//        )
    }
    
    func makeCoordinator() -> CustomUISlider.Coordinator {
        Coordinator(value: $value, color: color)
    }
    
}

extension CustomUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        let color: UIColor
        
        init(value: Binding<Double>, color: UIColor) {
            self._value = value
            self.color = color
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
            sender.thumbTintColor = color
        }
    }
}




struct CustomUISlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomUISlider(value: .constant(50), color: .black)
    }
}

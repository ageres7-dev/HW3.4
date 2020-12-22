//
//  CustomUISlider.swift
//  HW3.4
//
//  Created by Сергей on 21.12.2020.
//

import SwiftUI

struct CustomUISlider: UIViewRepresentable {
    @Binding var value: Double
    let color: UIColor

    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color
    }
    
    func makeCoordinator() -> CustomUISlider.Coordinator {
        Coordinator(value: $value)
    }
    
}

extension CustomUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)

        }
    }
}




struct CustomUISlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomUISlider(value: .constant(50), color: .black)
    }
}

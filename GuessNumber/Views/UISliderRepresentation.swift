//
//  UISliderRepresentation.swift
//  GuessNumber
//
//  Created by Евгений on 10.10.2024.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let thumbSliderAlpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.getSLiderValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = .red.withAlphaComponent(thumbSliderAlpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func getSLiderValue(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

#Preview {
    UISliderRepresentation(currentValue: .constant(10), thumbSliderAlpha: 0.5)
}

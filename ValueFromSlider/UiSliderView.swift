//
//  UiSliderView.swift
//  ValueFromSlider
//
//  Created by Philip Noskov on 13.06.2021.
//

import SwiftUI

struct UiSliderView: UIViewRepresentable {

    @Binding var currentValue: Double
    var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.sliderValueChanged),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1,
                                        green: 0,
                                        blue: 0,
                                        alpha: CGFloat(alpha)
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
}

extension UiSliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct UiSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UiSliderView(currentValue: .constant(50), alpha: 0.5)
    }
}

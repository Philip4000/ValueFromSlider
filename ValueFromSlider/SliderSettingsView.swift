//
//  SliderSettingsView.swift
//  ValueFromSlider
//
//  Created by Philip Noskov on 13.06.2021.
//

import SwiftUI

struct SliderSettingsView: View {
    
    @Binding var currentValue: Double
    var alpha: Double
    
    var body: some View {
        HStack {
            Text("0")
            UiSliderView(currentValue: $currentValue, alpha: alpha)
            Text("100")
        }
        
    }
}

struct SliderSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SliderSettingsView(currentValue: .constant(50), alpha: 0.8)
    }
}

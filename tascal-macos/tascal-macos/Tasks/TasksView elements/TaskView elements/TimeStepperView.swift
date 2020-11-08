//
//  TimeStepperView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import SwiftUI

struct TimeStepperView: View {
    
    @Binding var time: String
    var time_step: Double

    
    var body: some View {
        
        VStack {
            // increase time
            Button {
                if Double(time) != nil {
                    time = String(Double(time)! + time_step)
                }
            } label: {
                Image(systemName: "arrowtriangle.up.fill")
                    .foregroundColor(Color.accentColor)
                    .imageScale(.small)
            }
            
            // decrease time
            Button {
                if Double(time) != nil {
                    if (Double(time)! > 0.0) { time = String(Double(time)! - time_step) }
                }
            } label: {
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundColor(Color.accentColor)
                    .imageScale(.small)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

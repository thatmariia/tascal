//
//  DayBoxViewModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 08/11/2020.
//

import Foundation
import SwiftUI

struct DayBoxViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 3, trailing: 15))
            
            //.background(ColorSecondary.opacity(1.0))
            //.cornerRadius(10)
            
            //.foregroundColor(ColorPrimary)
            //.accentColor(Color.accentColor)
    }
    
}



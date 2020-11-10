//
//  DateFrameViewModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct DateFrameViewModifier: ViewModifier {
    
    var is_today: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            
            .background(Color.accentColor.opacity(is_today ? 1.0 : 0.0))
            .cornerRadius(10)
            
            .foregroundColor(is_today ? Color.white : Color.primary)
    }
}

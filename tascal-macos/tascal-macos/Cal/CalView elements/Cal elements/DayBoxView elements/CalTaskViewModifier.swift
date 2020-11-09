//
//  CalTaskViewModifier.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct CalTaskViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.body)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            
            .background(ColorSecondary)
            .cornerRadius(5)
    }
}
